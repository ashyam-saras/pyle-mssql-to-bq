-- Create main table if not exists
CREATE TABLE IF NOT EXISTS {bq_project}.{bq_dataset}.{table_name} (
    AutoId INT64,
    SKU STRING,
    SellerSKU STRING,
    ASIN STRING,
    Buyer STRING,
    TotalSAStock INT64,
    TotalInbound INT64,
    TotalReserved INT64,
    FulfillableQTY INT64,
    TotalFBAInventory INT64,
    NetReceivedUnits INT64,
    OpenPOQuantity INT64,
    SellableOnHandUnits INT64,
    SC7DSales INT64,
    SC30DSales INT64,
    SC60DSales INT64,
    SC90DSales INT64,
    Merchant7DSales INT64,
    Merchant30DSales INT64,
    Merchant60DSales INT64,
    ItemPrice FLOAT64,
    CalcLanded FLOAT64,
    Pack INT64,
    CreatedData TIMESTAMP,
    ModifiedDate TIMESTAMP,
    Merchant90DSales INT64,
    UnhealthyInventory INT64,
    DaysofStockRemaining STRING,
    FCTransfer INT64,
    SellerAccount STRING,
    estimated_referral_fee_per_unit FLOAT64,
    expected_fulfillment_fee_per_unit FLOAT64,
    SellerMargin FLOAT64,
    IsActive BOOL,
    warehouse_ny_qty INT64,
    warehouse_la_qty INT64,
    warehouse_gpa_qty INT64,
    SuggestedQty INT64,
    AutoReplinish BOOL,
    SA7DSales INT64,
    SA30DSales INT64,
    SA60DSales INT64,
    SA90DSales INT64,
    fnsku STRING,
    IdBuyer INT64,
    inv_age_0_to_90_days INT64,
    inv_age_91_to_180_days INT64,
    inv_age_181_to_365_days INT64,
    inv_age_365_plus_days INT64,
    warehouse_tx_qty INT64,
    Brand STRING,
    IsActiveList STRING
);

-- Merge data from temp table to main table
MERGE {bq_project}.{bq_dataset}.{table_name} AS MAIN
USING {bq_project}.{bq_dataset}.temp_{table_name} AS TEMP
ON MAIN.AutoId = TEMP.AutoId
WHEN MATCHED THEN
    UPDATE SET
        MAIN.AutoId = TEMP.AutoId,
        MAIN.SKU = TEMP.SKU,
        MAIN.SellerSKU = TEMP.SellerSKU,
        MAIN.ASIN = TEMP.ASIN,
        MAIN.Buyer = TEMP.Buyer,
        MAIN.TotalSAStock = TEMP.TotalSAStock,
        MAIN.TotalInbound = TEMP.TotalInbound,
        MAIN.TotalReserved = TEMP.TotalReserved,
        MAIN.FulfillableQTY = TEMP.FulfillableQTY,
        MAIN.TotalFBAInventory = TEMP.TotalFBAInventory,
        MAIN.NetReceivedUnits = TEMP.NetReceivedUnits,
        MAIN.OpenPOQuantity = TEMP.OpenPOQuantity,
        MAIN.SellableOnHandUnits = TEMP.SellableOnHandUnits,
        MAIN.SC7DSales = TEMP.SC7DSales,
        MAIN.SC30DSales = TEMP.SC30DSales,
        MAIN.SC60DSales = TEMP.SC60DSales,
        MAIN.SC90DSales = TEMP.SC90DSales,
        MAIN.Merchant7DSales = TEMP.Merchant7DSales,
        MAIN.Merchant30DSales = TEMP.Merchant30DSales,
        MAIN.Merchant60DSales = TEMP.Merchant60DSales,
        MAIN.ItemPrice = TEMP.ItemPrice,
        MAIN.CalcLanded = TEMP.CalcLanded,
        MAIN.Pack = TEMP.Pack,
        MAIN.CreatedData = TEMP.CreatedData,
        MAIN.ModifiedDate = TEMP.ModifiedDate,
        MAIN.Merchant90DSales = TEMP.Merchant90DSales,
        MAIN.UnhealthyInventory = TEMP.UnhealthyInventory,
        MAIN.DaysofStockRemaining = TEMP.DaysofStockRemaining,
        MAIN.FCTransfer = TEMP.FCTransfer,
        MAIN.SellerAccount = TEMP.SellerAccount,
        MAIN.estimated_referral_fee_per_unit = TEMP.estimated_referral_fee_per_unit,
        MAIN.expected_fulfillment_fee_per_unit = TEMP.expected_fulfillment_fee_per_unit,
        MAIN.SellerMargin = TEMP.SellerMargin,
        MAIN.IsActive = TEMP.IsActive,
        MAIN.warehouse_ny_qty = TEMP.warehouse_ny_qty,
        MAIN.warehouse_la_qty = TEMP.warehouse_la_qty,
        MAIN.warehouse_gpa_qty = TEMP.warehouse_gpa_qty,
        MAIN.SuggestedQty = TEMP.SuggestedQty,
        MAIN.AutoReplinish = TEMP.AutoReplinish,
        MAIN.SA7DSales = TEMP.SA7DSales,
        MAIN.SA30DSales = TEMP.SA30DSales,
        MAIN.SA60DSales = TEMP.SA60DSales,
        MAIN.SA90DSales = TEMP.SA90DSales,
        MAIN.fnsku = TEMP.fnsku,
        MAIN.IdBuyer = TEMP.IdBuyer,
        MAIN.inv_age_0_to_90_days = TEMP.inv_age_0_to_90_days,
        MAIN.inv_age_91_to_180_days = TEMP.inv_age_91_to_180_days,
        MAIN.inv_age_181_to_365_days = TEMP.inv_age_181_to_365_days,
        MAIN.inv_age_365_plus_days = TEMP.inv_age_365_plus_days,
        MAIN.warehouse_tx_qty = TEMP.warehouse_tx_qty,
        MAIN.Brand = TEMP.Brand,
        MAIN.IsActiveList = TEMP.IsActiveList
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.AutoId,
    TEMP.SKU,
    TEMP.SellerSKU,
    TEMP.ASIN,
    TEMP.Buyer,
    TEMP.TotalSAStock,
    TEMP.TotalInbound,
    TEMP.TotalReserved,
    TEMP.FulfillableQTY,
    TEMP.TotalFBAInventory,
    TEMP.NetReceivedUnits,
    TEMP.OpenPOQuantity,
    TEMP.SellableOnHandUnits,
    TEMP.SC7DSales,
    TEMP.SC30DSales,
    TEMP.SC60DSales,
    TEMP.SC90DSales,
    TEMP.Merchant7DSales,
    TEMP.Merchant30DSales,
    TEMP.Merchant60DSales,
    TEMP.ItemPrice,
    TEMP.CalcLanded,
    TEMP.Pack,
    TEMP.CreatedData,
    TEMP.ModifiedDate,
    TEMP.Merchant90DSales,
    TEMP.UnhealthyInventory,
    TEMP.DaysofStockRemaining,
    TEMP.FCTransfer,
    TEMP.SellerAccount,
    TEMP.estimated_referral_fee_per_unit,
    TEMP.expected_fulfillment_fee_per_unit,
    TEMP.SellerMargin,
    TEMP.IsActive,
    TEMP.warehouse_ny_qty,
    TEMP.warehouse_la_qty,
    TEMP.warehouse_gpa_qty,
    TEMP.SuggestedQty,
    TEMP.AutoReplinish,
    TEMP.SA7DSales,
    TEMP.SA30DSales,
    TEMP.SA60DSales,
    TEMP.SA90DSales,
    TEMP.fnsku,
    TEMP.IdBuyer,
    TEMP.inv_age_0_to_90_days,
    TEMP.inv_age_91_to_180_days,
    TEMP.inv_age_181_to_365_days,
    TEMP.inv_age_365_plus_days,
    TEMP.warehouse_tx_qty,
    TEMP.Brand,
    TEMP.IsActiveList
)
