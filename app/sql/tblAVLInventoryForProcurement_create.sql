CREATE OR REPLACE TABLE `{bq_project}.{bq_dataset}.{table_name}` (
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