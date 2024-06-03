-- Create main table if not exists
CREATE TABLE IF NOT EXISTS {bq_project}.{bq_dataset}.{table_name} (
    ITEM_ STRING,
    casepack INT64,
    CUBE1unit FLOAT64,
    cuftcase FLOAT64
);

-- Merge data from temp table to main table
MERGE {bq_project}.{bq_dataset}.{table_name} AS MAIN
USING {bq_project}.{bq_dataset}.{temp_table_name} AS TEMP
ON MAIN.ITEM_ = TEMP.ITEM_
WHEN MATCHED THEN
    UPDATE SET
        MAIN.ITEM_ = TEMP.ITEM_,
        MAIN.casepack = TEMP.casepack,
        MAIN.CUBE1unit = TEMP.CUBE1unit,
        MAIN.cuftcase = TEMP.cuftcase
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.ITEM_,
    TEMP.casepack,
    TEMP.CUBE1unit,
    TEMP.cuftcase
)
