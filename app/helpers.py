import logging
import os
from pathlib import Path
from typing import Any
from urllib.parse import quote

import pandas as pd
from google.cloud import bigquery, storage
from sqlalchemy import create_engine
from sshtunnel import SSHTunnelForwarder

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("helper")

# SQL file directory
SQL_DIR = Path(__file__).parent / "sql"

# SSH tunnel parameters
SSH_HOST = os.environ["SSH_HOST"]
SSH_PORT = int(os.environ["SSH_PORT"])
SSH_USERNAME = os.environ["SSH_USERNAME"]
SSH_KEY_PATH = Path("/ssh/daton-ssh")

# Database parameters
DB_HOST = os.environ["DB_HOST"]
DB_PORT = int(os.environ["DB_PORT"])
DB_USERNAME = os.environ["DB_USERNAME"]
DB_PASSWORD = quote(os.environ["DB_PASSWORD"])
DB_NAME = os.environ["DB_NAME"]
DB_DIALECT = "mssql+pyodbc"
DB_DRIVER = "ODBC+Driver+18+for+SQL+Server"


def safe_strftime(s, fmt):
    return s if pd.isnull(s) else s.strftime(fmt)


def convert_to_Int64(df):
    for col in df.columns:
        if df[col].dtype == "float64" and df[col].dropna().apply(float.is_integer).all():
            df[col] = df[col].astype("Int64")
    return df


def execute_mssql_query(query: str, params: tuple[str, Any] = None) -> pd.DataFrame:
    """
    Execute a query against MSSQL and return the result as a Pandas DataFrame.

    Args:
        query (str): The query to execute.
        params (tuple(str, Any)): The parameters to pass to the parameterized query.

    Returns:
        pd.DataFrame: The result of the query.
    """
    logger.info("Executing query.")
    logger.info("Connecting to SSH tunnel.")
    logger.debug("SSH: %s@%s:%s", SSH_USERNAME, SSH_HOST, SSH_PORT)

    if not SSH_KEY_PATH.exists():
        logger.error("SSH key not found.")
        logger.error("File path: %s", SSH_KEY_PATH)
        raise FileNotFoundError("SSH key not found.")

    with SSHTunnelForwarder(
        (SSH_HOST, SSH_PORT),
        ssh_username=SSH_USERNAME,
        ssh_pkey=str(SSH_KEY_PATH),
        remote_bind_address=(DB_HOST, DB_PORT),
    ) as tunnel:
        logger.info("Connected to SSH tunnel.")
        url = f"{DB_DIALECT}://{DB_USERNAME}:{DB_PASSWORD}@localhost:{tunnel.local_bind_port}/{DB_NAME}?driver={DB_DRIVER}&Encrypt=no"
        engine = create_engine(url, echo=True)

        logger.debug("Connecting to database.")
        with engine.connect() as conn:
            result_df = pd.read_sql(query, conn, params=params)
            result_df = convert_to_Int64(result_df)
    return result_df


def create_temp_table(
    bq_client: bigquery.Client,
    bq_project: str,
    bq_dataset: str,
    table_name: str,
):
    """
    Create a temporary table in BigQuery.

    Args:
        bq_client (bigquery.Client): The BigQuery client.
        bq_project (str): The BigQuery project.
        bq_dataset (str): The BigQuery dataset.
        table_name (str): The name of the table to create.
    """
    logger.info("Creating temp table.")
    query_path = SQL_DIR / f"{table_name}_create.sql"
    if not query_path.exists():
        logger.error("%s not found.", query_path)
        raise FileNotFoundError("SQL file not found. Must be named `{src_table}_create.sql`.")

    # Read create temp table SQL file
    with open(query_path, "r", encoding="utf-8") as f:
        query = f.read()

    # Format query
    query = query.format(
        bq_project=bq_project,
        bq_dataset=bq_dataset,
        table_name=table_name,
    )

    logger.debug("Executing query: %s", query)
    execute_job = bq_client.query(query)
    execute_job.result()  # wait for job to complete
    logger.info("Created temp table.")


def merge_temp_table(
    bq_client: bigquery.Client,
    bq_project: str,
    bq_dataset: str,
    table_name: str,
    delete_temp_table: bool = True,
):
    """
    Merge a temporary table with the destination table.

    Args:
        bq_client (bigquery.Client): The BigQuery client.
        bq_project (str): The BigQuery project.
        bq_dataset (str): The BigQuery dataset.
        table_name (str): The name of the table to merge.
        delete_temp_table (bool, optional): Whether to delete the temporary table after
            merging. Defaults to True.
    """
    logger.info("Merging temp table with destination table.")

    # Check if merge SQL file exists
    query_path = SQL_DIR / f"{table_name}_merge.sql"
    if not query_path.exists():
        raise FileNotFoundError("SQL file not found. Must be named `{src_table}_merge.sql`.")

    # Read merge SQL file
    with open(query_path, "r", encoding="utf-8") as f:
        query = f.read()

    # Format query
    query = query.format(
        bq_project=bq_project,
        bq_dataset=bq_dataset,
        table_name=table_name,
    )

    logger.debug("Executing query: %s", query)
    execute_job = bq_client.query(query)
    execute_job.result()  # wait for job to complete
    logger.info("Merged temp table with destination table.")

    if delete_temp_table:
        logger.info("Deleting temp table.")
        bq_client.delete_table(f"{bq_project}.{bq_dataset}.temp_{table_name}")
        logger.info("Deleted temp table.")


def upload_to_gs(
    storage_client: storage.Client,
    gs_bucket: str,
    dest_path: str,
    source_path: Path,
):
    """
    Upload a file to Google Cloud Storage.

    Args:
        storage_client (storage.Client): The GCS client.
        bucket (str): The name of the bucket.
        dest_path (str): The destination path in the bucket.
        source_path (Path): The path of the file to upload.
    """
    logger.info("Uploading file to GCS.")
    bucket = storage_client.bucket(gs_bucket)
    blob = bucket.blob(dest_path)
    logger.debug("Uploading `%s` to `%s/%s`.", source_path, gs_bucket, dest_path)
    blob.upload_from_filename(source_path)
    logger.info("Uploaded file to GCS.")


def gs_csv_to_bq(
    bq_client: bigquery.Client,
    gs_uri: str,
    bq_project: str,
    bq_dataset: str,
    table_name: str,
):
    """
    Load data from GCS to BigQuery.

    Args:
        bq_client (bigquery.Client): The BigQuery client.
        gs_uri (str): The URI of the CSV file in GCS.
        bq_project (str): The BigQuery project.
        bq_dataset (str): The BigQuery dataset.
        table_name (str): The name of the table to load the data into.
    """
    logger.info("Loading CSV data from GCS to BigQuery.")
    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=False,
        allow_quoted_newlines=True,
    )
    table_id = f"{bq_project}.{bq_dataset}.{table_name}"
    logger.debug("Loading data from `%s` to `%s`...", gs_uri, table_id)
    load_job = bq_client.load_table_from_uri(gs_uri, table_id, job_config=job_config)
    load_job.result()  # Waits for the job to complete
    logger.info("Loaded data from GCS to BigQuery.")
