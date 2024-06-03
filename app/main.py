# The Google Cloud Function
import csv
import logging
import os
from datetime import datetime, timedelta
from pathlib import Path

from fastapi import FastAPI, Request
from google.cloud import bigquery, storage

from app.helpers import (
    create_temp_table,
    execute_mssql_query,
    gs_csv_to_bq,
    merge_temp_table,
    safe_strftime,
    upload_to_gs,
)

app = FastAPI()
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("gcf_logger")

try:
    from dotenv import load_dotenv

    load_dotenv()
except ModuleNotFoundError:
    print("dotenv is not installed. Only used for local development.")

# BigQuery parameters
BQ_PROJECT = os.environ["BQ_PROJECT"]
BQ_DATASET = os.environ["BQ_DATASET"]

# GCS parameters
GCS_BUCKET = os.environ["GCS_BUCKET"]

# GCP parameters
SERVICE_ACCOUNT_PATH = Path(__file__).parent / "service_account.json"

# Other parameters
DATE_FMT = r"%Y-%m-%d"
TIMESTAMP_FMT = r"%Y-%m-%d %H:%M:%S"


# Check if the service account file exists
if not SERVICE_ACCOUNT_PATH.exists():
    raise FileNotFoundError(f"Service account file not found.")


@app.post("/mssql_to_bq")
async def mssql_to_bq(request: Request):
    """
    API endpoint for exporting data from MSSQL to BigQuery.

    Args:
        request (Request): The request object.

    Returns:
        str: A message indicating that the data has been exported.
    """
    logger.info("Received request.")
    request_json: dict = await request.json()

    # Mandatory parameters
    source_table = request_json["source_table"]
    date_filter_col = request_json["date_filter_column"]

    # Optional parameters
    mode = request_json.get("mode", "normal")  # normal or historical
    dest_table = request_json.get("destination_table", source_table)
    start_date = request_json.get("start_date", None)
    end_date = request_json.get("end_date", None)
    gcs_bucket = request_json.get("gcs_bucket", GCS_BUCKET)
    gcs_path = request_json.get("gcs_path", source_table)
    file_name = request_json.get("file_name")
    date_cols = request_json.get("date_columns", [])
    timestamp_cols = request_json.get("timestamp_columns", [])
    drop_and_create = request_json.get("drop_and_create", False)

    if start_date is None:
        start_date = (datetime.now() - timedelta(30)).strftime(r"%Y-%m-%d")

    if end_date is None:
        end_date = datetime.now().strftime(r"%Y-%m-%d")

    # Initialize GCP clients
    storage_client = storage.Client.from_service_account_json(SERVICE_ACCOUNT_PATH)
    bigquery_client = bigquery.Client.from_service_account_json(SERVICE_ACCOUNT_PATH)

    # Query data from MSSQL
    logger.info("Querying data from MSSQL.")
    if mode == "historical" or date_filter_col is None:
        query = f"SELECT * FROM {source_table}"
        df = execute_mssql_query(query)
        file_name = f"{source_table}-historical-{datetime.now():%Y%m%d%H%M%S}.csv"
    else:
        query = f"SELECT * FROM {source_table} WHERE {date_filter_col} BETWEEN ? AND ?"
        params = (start_date, end_date)
        df = execute_mssql_query(query, params=params)
        file_name = file_name or f"{source_table}-{start_date}-{end_date}.csv"
    logger.debug("Rows queried: %s", len(df))

    clean_df = df.copy()
    clean_df = clean_df.replace({"\x00": ""}, regex=True)

    # Save data to a temporary CSV
    temp_csv_path = Path(__file__).parent / file_name
    logger.debug("Saving data to %s.", temp_csv_path)
    if not df[date_cols].isnull().all().all():
        df[date_cols] = df[date_cols].map(lambda x: safe_strftime(x, DATE_FMT))
    if not df[timestamp_cols].isnull().all().all():
        df[timestamp_cols] = df[timestamp_cols].map(lambda x: safe_strftime(x, TIMESTAMP_FMT))
    clean_df.to_csv(temp_csv_path, index=False, quoting=csv.QUOTE_NONNUMERIC)

    # Upload CSV to temp GCS
    gs_csv_file_path = f"{gcs_path}/{file_name}"
    upload_to_gs(storage_client, gcs_bucket, gs_csv_file_path, temp_csv_path)

    # Load data from GCS to BigQuery, create temporary table, and merge with destination table
    uri = f"gs://{gcs_bucket}/{gs_csv_file_path}"
    temp_table = f"temp_{dest_table}"
    create_sql_fname = f"{source_table}_create.sql"
    merge_sql_fname = f"{source_table}_merge.sql"

    # Create temporary table, load data from GCS to BigQuery, and merge with destination table
    create_temp_table(
        bigquery_client,
        BQ_PROJECT,
        BQ_DATASET,
        create_sql_fname,
        temp_table,
    )
    gs_csv_to_bq(
        bigquery_client,
        BQ_PROJECT,
        BQ_DATASET,
        uri,
        temp_table,
    )
    merge_temp_table(
        bigquery_client,
        BQ_PROJECT,
        BQ_DATASET,
        merge_sql_fname,
        dest_table,
        temp_table,
        drop_and_create=drop_and_create,
    )

    # Delete temporary CSV
    logger.info("Deleting temporary CSV.")
    temp_csv_path.unlink(missing_ok=True)

    logger.info("Done.")
    return "Exported data from MSSQL to BigQuery."
