-- Create main table if not exists
CREATE TABLE IF NOT EXISTS `{bq_project}.{bq_dataset}.{table_name}` (
    idProduct INT64,
    idCategory INT64,
    idautonumber INT64,
    categoryType STRING
);

-- Merge data from temp table to main table
MERGE `{bq_project}.{bq_dataset}.{table_name}` AS MAIN
USING `{bq_project}.{bq_dataset}.{temp_table_name}` AS TEMP
ON MAIN.idautonumber = TEMP.idautonumber
WHEN MATCHED THEN
    UPDATE SET
        MAIN.idProduct = TEMP.idProduct,
        MAIN.idCategory = TEMP.idCategory,
        MAIN.idautonumber = TEMP.idautonumber,
        MAIN.categoryType = TEMP.categoryType
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.idProduct,
    TEMP.idCategory,
    TEMP.idautonumber,
    TEMP.categoryType
)
