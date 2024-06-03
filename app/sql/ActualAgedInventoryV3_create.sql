CREATE OR REPLACE TABLE {bq_project}.{bq_dataset}.{table_name} (
    RowNum INT64,
    Item_ STRING,
    Description STRING,
    DateReceived TIMESTAMP,
    QtyReceived INT64,
    AmountOfPurchaseStillInStock INT64,
    RemainingLeftToAssignToAPurchase INT64,
    AgeOfInventoryInDays INT64,
    CurrentInventory INT64,
    ItemPrice FLOAT64,
    Buyer STRING,
    supplierName STRING,
    Category STRING,
    Idwarehouse INT64,
    LTM INT64,
    CubicFt FLOAT64
);