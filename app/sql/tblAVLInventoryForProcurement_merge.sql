-- Create main table if not exists
CREATE TABLE IF NOT EXISTS `{bq_project}.{bq_dataset}.{table_name}` (
    Autoid INT64,
    IdWarehouse INT64,
    SKU STRING,
    Stock INT64,
    IncomingStock INT64,
    OnWater INT64,
    Transfer INT64,
    DateRecordCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    AllocatedStock INT64,
    ReserveBOM INT64,
    ReserveManual INT64,
    TotalAvlStock INT64,
    SANetAvlStock INT64
);

-- Merge data from temp table to main table
MERGE `{bq_project}.{bq_dataset}.{table_name}` AS MAIN
USING `{bq_project}.{bq_dataset}.{temp_table_name}` AS TEMP
ON MAIN.Autoid = TEMP.Autoid
WHEN MATCHED THEN
    UPDATE SET
        MAIN.Autoid = TEMP.Autoid,
        MAIN.IdWarehouse = TEMP.IdWarehouse,
        MAIN.SKU = TEMP.SKU,
        MAIN.Stock = TEMP.Stock,
        MAIN.IncomingStock = TEMP.IncomingStock,
        MAIN.OnWater = TEMP.OnWater,
        MAIN.Transfer = TEMP.Transfer,
        MAIN.DateRecordCreated = TEMP.DateRecordCreated,
        MAIN.AllocatedStock = TEMP.AllocatedStock,
        MAIN.ReserveBOM = TEMP.ReserveBOM,
        MAIN.ReserveManual = TEMP.ReserveManual,
        MAIN.TotalAvlStock = TEMP.TotalAvlStock,
        MAIN.SANetAvlStock = TEMP.SANetAvlStock
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.Autoid,
    TEMP.IdWarehouse,
    TEMP.SKU,
    TEMP.Stock,
    TEMP.IncomingStock,
    TEMP.OnWater,
    TEMP.Transfer,
    TEMP.DateRecordCreated,
    TEMP.AllocatedStock,
    TEMP.ReserveBOM,
    TEMP.ReserveManual,
    TEMP.TotalAvlStock,
    TEMP.SANetAvlStock
)
