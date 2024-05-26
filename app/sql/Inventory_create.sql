CREATE OR REPLACE TABLE {bq_project}.{bq_dataset}.temp_{table_name} (
    idInvent INT64,
    idWarehouse INT64,
    idSuppliers STRING,
    idProduct INT64,
    SKU STRING,
    stock INT64,
    AllocatedStock INT64,
    LastUpdated TIMESTAMP,
    ExpDate STRING,
    OnOrder INT64,
    AdjustQty STRING,
    isManual BOOL,
    Reason STRING,
    QtyLast0 TIMESTAMP,
    QtyLastStock TIMESTAMP,
    VendorSku STRING,
    Cost FLOAT64,
    SCost STRING,
    SCostToDate STRING,
    StockActive INT64,
    invOff STRING,
    ExportCost STRING,
    isMatched STRING,
    ReservQty INT64,
    ReservKitsQty STRING,
    ReservQty1 STRING,
    ReservKitsQty1 STRING,
    Location STRING,
    LastStock INT64,
    Restock BOOL,
    Transfer INT64,
    OnWater INT64,
    LastLocation STRING,
    Discontinued INT64,
    DateAdded STRING,
    ONPO INT64,
    VerifyDate TIMESTAMP,
    VerifyBy INT64,
    ReserveManual INT64,
    ReserveBOM INT64,
    TotalInventory INT64,
    TotalIncoming INT64,
    RemapSKU STRING
);