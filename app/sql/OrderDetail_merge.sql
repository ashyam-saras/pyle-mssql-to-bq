-- Create main table if not exists
CREATE TABLE IF NOT EXISTS {bq_project}.{bq_dataset}.{table_name} (
    idOrder FLOAT64,
    idProduct INT64,
    OrderItemID STRING,
    SKU STRING,
    OrderSKU STRING,
    IsKit BOOL,
    Description STRING,
    Qty INT64,
    ItemPrice FLOAT64,
    ItemTax FLOAT64,
    ShipPrice FLOAT64,
    ShipTax FLOAT64,
    ItemPromoDise STRING,
    ItemPromoID STRING,
    ShipPromoDise STRING,
    ShipPromoID STRING,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    ReturnHandFee STRING,
    ReturnFreightFee STRING,
    ARSCharge STRING,
    BuyersRemors STRING,
    ItemNote STRING,
    IsAllocated BOOL DEFAULT FALSE,
    ParentSKU STRING,
    BackOrder BOOL DEFAULT FALSE,
    InvUpdated BOOL DEFAULT FALSE,
    QC STRING,
    Replacement STRING,
    pulled STRING,
    pulledBy STRING,
    ispacked FLOAT64,
    packedBy FLOAT64,
    gift_message_text STRING,
    gift_wrap_price STRING,
    gift_wrap_tax STRING,
    idOrderDetail INT64,
    isHotDeal FLOAT64,
    PrdCost FLOAT64,
    gift_wrap_type STRING,
    IdWarehouseAlloc FLOAT64,
    fight FLOAT64,
    IsDropShipAlloc FLOAT64 DEFAULT 0.0,
    IdVendorAlloc STRING,
    dateOrderAllocate STRING,
    isShipped FLOAT64 DEFAULT 0.0,
    idUserAlloc STRING,
    Linenu FLOAT64 DEFAULT 0.0,
    QtyShipped FLOAT64 DEFAULT 0.0,
    idPOAlloc STRING,
    idVendorOrderNumberAlloc STRING,
    odAsin STRING,
    Description_2 STRING,
    PONumber STRING,
    IsBagPack STRING,
    IsPrime STRING,
    RSN STRING,
    QtyShipped945 FLOAT64,
    IsFBARepackItem STRING,
    IsRepack STRING
);

-- Merge data from temp table to main table
MERGE {bq_project}.{bq_dataset}.{table_name} AS MAIN
USING {bq_project}.{bq_dataset}.temp_{table_name} AS TEMP
ON MAIN.idOrder = TEMP.idOrder
    AND MAIN.idProduct = TEMP.idProduct
    AND MAIN.idOrderDetail = TEMP.idOrderDetail
WHEN MATCHED THEN
    UPDATE SET
        MAIN.idOrder = TEMP.idOrder,
        MAIN.idProduct = TEMP.idProduct,
        MAIN.OrderItemID = TEMP.OrderItemID,
        MAIN.SKU = TEMP.SKU,
        MAIN.OrderSKU = TEMP.OrderSKU,
        MAIN.IsKit = TEMP.IsKit,
        MAIN.Description = TEMP.Description,
        MAIN.Qty = TEMP.Qty,
        MAIN.ItemPrice = TEMP.ItemPrice,
        MAIN.ItemTax = TEMP.ItemTax,
        MAIN.ShipPrice = TEMP.ShipPrice,
        MAIN.ShipTax = TEMP.ShipTax,
        MAIN.ItemPromoDise = TEMP.ItemPromoDise,
        MAIN.ItemPromoID = TEMP.ItemPromoID,
        MAIN.ShipPromoDise = TEMP.ShipPromoDise,
        MAIN.ShipPromoID = TEMP.ShipPromoID,
        MAIN.DateCreated = TEMP.DateCreated,
        MAIN.ReturnHandFee = TEMP.ReturnHandFee,
        MAIN.ReturnFreightFee = TEMP.ReturnFreightFee,
        MAIN.ARSCharge = TEMP.ARSCharge,
        MAIN.BuyersRemors = TEMP.BuyersRemors,
        MAIN.ItemNote = TEMP.ItemNote,
        MAIN.IsAllocated = TEMP.IsAllocated,
        MAIN.ParentSKU = TEMP.ParentSKU,
        MAIN.BackOrder = TEMP.BackOrder,
        MAIN.InvUpdated = TEMP.InvUpdated,
        MAIN.QC = TEMP.QC,
        MAIN.Replacement = TEMP.Replacement,
        MAIN.pulled = TEMP.pulled,
        MAIN.pulledBy = TEMP.pulledBy,
        MAIN.ispacked = TEMP.ispacked,
        MAIN.packedBy = TEMP.packedBy,
        MAIN.gift_message_text = TEMP.gift_message_text,
        MAIN.gift_wrap_price = TEMP.gift_wrap_price,
        MAIN.gift_wrap_tax = TEMP.gift_wrap_tax,
        MAIN.idOrderDetail = TEMP.idOrderDetail,
        MAIN.isHotDeal = TEMP.isHotDeal,
        MAIN.PrdCost = TEMP.PrdCost,
        MAIN.gift_wrap_type = TEMP.gift_wrap_type,
        MAIN.IdWarehouseAlloc = TEMP.IdWarehouseAlloc,
        MAIN.fight = TEMP.fight,
        MAIN.IsDropShipAlloc = TEMP.IsDropShipAlloc,
        MAIN.IdVendorAlloc = TEMP.IdVendorAlloc,
        MAIN.dateOrderAllocate = TEMP.dateOrderAllocate,
        MAIN.isShipped = TEMP.isShipped,
        MAIN.idUserAlloc = TEMP.idUserAlloc,
        MAIN.Linenu = TEMP.Linenu,
        MAIN.QtyShipped = TEMP.QtyShipped,
        MAIN.idPOAlloc = TEMP.idPOAlloc,
        MAIN.idVendorOrderNumberAlloc = TEMP.idVendorOrderNumberAlloc,
        MAIN.odAsin = TEMP.odAsin,
        MAIN.Description_2 = TEMP.Description_2,
        MAIN.PONumber = TEMP.PONumber,
        MAIN.IsBagPack = TEMP.IsBagPack,
        MAIN.IsPrime = TEMP.IsPrime,
        MAIN.RSN = TEMP.RSN,
        MAIN.QtyShipped945 = TEMP.QtyShipped945,
        MAIN.IsFBARepackItem = TEMP.IsFBARepackItem,
        MAIN.IsRepack = TEMP.IsRepack
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.idOrder,
    TEMP.idProduct,
    TEMP.OrderItemID,
    TEMP.SKU,
    TEMP.OrderSKU,
    TEMP.IsKit,
    TEMP.Description,
    TEMP.Qty,
    TEMP.ItemPrice,
    TEMP.ItemTax,
    TEMP.ShipPrice,
    TEMP.ShipTax,
    TEMP.ItemPromoDise,
    TEMP.ItemPromoID,
    TEMP.ShipPromoDise,
    TEMP.ShipPromoID,
    TEMP.DateCreated,
    TEMP.ReturnHandFee,
    TEMP.ReturnFreightFee,
    TEMP.ARSCharge,
    TEMP.BuyersRemors,
    TEMP.ItemNote,
    TEMP.IsAllocated,
    TEMP.ParentSKU,
    TEMP.BackOrder,
    TEMP.InvUpdated,
    TEMP.QC,
    TEMP.Replacement,
    TEMP.pulled,
    TEMP.pulledBy,
    TEMP.ispacked,
    TEMP.packedBy,
    TEMP.gift_message_text,
    TEMP.gift_wrap_price,
    TEMP.gift_wrap_tax,
    TEMP.idOrderDetail,
    TEMP.isHotDeal,
    TEMP.PrdCost,
    TEMP.gift_wrap_type,
    TEMP.IdWarehouseAlloc,
    TEMP.fight,
    TEMP.IsDropShipAlloc,
    TEMP.IdVendorAlloc,
    TEMP.dateOrderAllocate,
    TEMP.isShipped,
    TEMP.idUserAlloc,
    TEMP.Linenu,
    TEMP.QtyShipped,
    TEMP.idPOAlloc,
    TEMP.idVendorOrderNumberAlloc,
    TEMP.odAsin,
    TEMP.Description_2,
    TEMP.PONumber,
    TEMP.IsBagPack,
    TEMP.IsPrime,
    TEMP.RSN,
    TEMP.QtyShipped945,
    TEMP.IsFBARepackItem,
    TEMP.IsRepack
)
