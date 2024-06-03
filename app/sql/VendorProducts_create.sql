CREATE OR REPLACE TABLE {bq_project}.{bq_dataset}.{table_name} (
    idVendorProducts INT64,
    idUpc INT64,
    idSupplier INT64,
    Vendorsku STRING,
    Model STRING,
    FOBPrice FLOAT64,
    FOBCHNG STRING,
    Duty FLOAT64,
    ft FLOAT64,
    ct INT64,
    FREIGHT FLOAT64,
    LAND STRING,
    Commission FLOAT64,
    DutyPercent FLOAT64 DEFAULT 12,
    ContainerCost INT64 DEFAULT 4500,
    TruckCost1 INT64 DEFAULT 0,
    TruckCost2 INT64 DEFAULT 0,
    MCHeight FLOAT64,
    MCWidth FLOAT64,
    MCDepth FLOAT64,
    Dealer35 FLOAT64,
    L3_35 FLOAT64,
    P_35 FLOAT64,
    WhoAdded INT64,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    Note STRING,
    CalcLanded FLOAT64,
    `default` BOOLEAN,
    weight FLOAT64,
    PrdUnitWeight FLOAT64,
    MCGWeight FLOAT64,
    width FLOAT64,
    height FLOAT64,
    GBHeight FLOAT64,
    GBWidth FLOAT64,
    GBDepth FLOAT64,
    Depth FLOAT64,
    packed STRING,
    description STRING,
    details STRING,
    introduction STRING,
    specification STRING,
    TYPE1 STRING,
    TYPE2 STRING,
    TYPE3 STRING,
    `GROUP` STRING,
    SPECIAL BOOLEAN,
    Title40 STRING,
    ExpPrice FLOAT64,
    LastDateOrdered STRING,
    LastCost FLOAT64,
    LastQtyOrdered INT64,
    JanQty INT64,
    FebQty INT64,
    MarQty INT64,
    AprQty INT64,
    MayQty INT64,
    JunQty INT64,
    JulyQty INT64,
    AugQty INT64,
    SeptQty INT64,
    OctQty INT64,
    NovQty INT64,
    DecQty INT64,
    MTDQty INT64,
    MTDSale INT64,
    YTDQty INT64,
    YTDSale INT64,
    LTMSale INT64,
    LTMQty INT64,
    REPLACECOST FLOAT64,
    CSAVGcost FLOAT64 DEFAULT 0.0,
    CSInsideCost FLOAT64 DEFAULT 0.0,
    CSLPrice2 FLOAT64 DEFAULT 0.0,
    CSLPrice3 FLOAT64 DEFAULT 0.0,
    idBuyer INT64,
    CostEffectiveDate DATE,
    ShippingVolumne INT64
);