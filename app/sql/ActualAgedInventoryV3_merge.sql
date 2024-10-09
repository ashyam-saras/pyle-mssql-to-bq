-- Create main table if not exists
CREATE TABLE IF NOT EXISTS `{bq_project}.{bq_dataset}.{table_name}` (
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

-- Merge data from temp table to main table
MERGE `{bq_project}.{bq_dataset}.{table_name}` AS MAIN
USING `{bq_project}.{bq_dataset}.{temp_table_name}` AS TEMP
ON MAIN.RowNum = TEMP.RowNum
    AND MAIN.Item_ = TEMP.Item_
    AND MAIN.DateReceived = TEMP.DateReceived
WHEN MATCHED THEN
    UPDATE SET
        MAIN.RowNum = TEMP.RowNum,
        MAIN.Item_ = TEMP.Item_,
        MAIN.Description = TEMP.Description,
        MAIN.DateReceived = TEMP.DateReceived,
        MAIN.QtyReceived = TEMP.QtyReceived,
        MAIN.AmountOfPurchaseStillInStock = TEMP.AmountOfPurchaseStillInStock,
        MAIN.RemainingLeftToAssignToAPurchase = TEMP.RemainingLeftToAssignToAPurchase,
        MAIN.AgeOfInventoryInDays = TEMP.AgeOfInventoryInDays,
        MAIN.CurrentInventory = TEMP.CurrentInventory,
        MAIN.ItemPrice = TEMP.ItemPrice,
        MAIN.Buyer = TEMP.Buyer,
        MAIN.supplierName = TEMP.supplierName,
        MAIN.Category = TEMP.Category,
        MAIN.Idwarehouse = TEMP.Idwarehouse,
        MAIN.LTM = TEMP.LTM,
        MAIN.CubicFt = TEMP.CubicFt
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.RowNum,
    TEMP.Item_,
    TEMP.Description,
    TEMP.DateReceived,
    TEMP.QtyReceived,
    TEMP.AmountOfPurchaseStillInStock,
    TEMP.RemainingLeftToAssignToAPurchase,
    TEMP.AgeOfInventoryInDays,
    TEMP.CurrentInventory,
    TEMP.ItemPrice,
    TEMP.Buyer,
    TEMP.supplierName,
    TEMP.Category,
    TEMP.Idwarehouse,
    TEMP.LTM,
    TEMP.CubicFt
)
