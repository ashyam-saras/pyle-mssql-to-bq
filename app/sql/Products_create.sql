CREATE OR REPLACE TABLE {bq_project}.{bq_dataset}.{table_name} (
    idProduct INT64,
    idwarehouse INT64,
    idSupplier INT64,
    description STRING,
    details STRING,
    Mcategory STRING,
    Category STRING,
    Subcategory STRING,
    price FLOAT64,
    listPrice FLOAT64,
    corpPrice FLOAT64,
    listOnePrice FLOAT64,
    listTwoPrice FLOAT64,
    listThreePrice FLOAT64,
    bToBPrice FLOAT64,
    Image STRING,
    imageUrl STRING,
    smallImageUrl STRING,
    sku STRING,
    stock INT64,
    listHidden INT64,
    weight FLOAT64,
    deliveringTime INT64,
    active INT64,
    hotDeal INT64,
    cost FLOAT64,
    scost FLOAT64,
    visits INT64,
    sales INT64,
    emailText STRING,
    stockLevelAlert INT64,
    formQuantity INT64,
    showInHome INT64,
    dateAdded STRING,
    hasPersonalization INT64,
    freeShipping INT64,
    isBundleMain INT64,
    bonusPoints FLOAT64,
    searchKeywords STRING,
    length FLOAT64,
    width FLOAT64,
    height FLOAT64,
    rental INT64,
    stockSecurity INT64,
    stockCostOrder FLOAT64,
    stockDelay INT64,
    stockMinimumOrder INT64,
    brand STRING,
    series STRING,
    sug FLOAT64,
    pack INT64,
    packed STRING,
    introduction STRING,
    accessories STRING,
    specification STRING,
    condition INT64,
    manual STRING,
    year STRING,
    warranty STRING,
    refurbished INT64,
    myProductNotes STRING,
    replacements STRING,
    externalLink INT64,
    searchsku STRING,
    upc STRING,
    dummyField INT64,
    PGMASTERID STRING,
    image2 STRING,
    image2Desc STRING,
    image3 STRING,
    image3Desc STRING,
    image4 STRING,
    image4Desc STRING,
    BuyCat STRING,
    EbayCat STRING,
    osCat STRING,
    iskit INT64,
    reservedQty INT64,
    tempStock INT64,
    GBHeight FLOAT64,
    GBWidth FLOAT64,
    GBDepth FLOAT64,
    GBWeight FLOAT64,
    prdUnitWeight FLOAT64,
    MCHeight FLOAT64,
    MCWidth FLOAT64,
    MCDepth FLOAT64,
    MCGWeight FLOAT64,
    Cuft FLOAT64,
    Catalog STRING,
    ExpCost FLOAT64,
    Asin STRING,
    MapPrice FLOAT64,
    OperFreq STRING,
    bullet_point1 STRING,
    bullet_point2 STRING,
    bullet_point3 STRING,
    bullet_point4 STRING,
    bullet_point5 STRING,
    search_terms1 STRING,
    search_terms2 STRING,
    search_terms3 STRING,
    search_terms4 STRING,
    search_terms5 STRING,
    CreatedBy STRING,
    Size STRING,
    isPart BOOLEAN,
    UPCType STRING,
    DateAvailable STRING,
    isGift INT64,
    Figth INT64,
    Fight INT64,
    WhoAdded INT64,
    AddedFrom STRING,
    CountryOrigin STRING,
    Bag INT64,
    TYPE1 STRING,
    TYPE2 STRING,
    `GROUP` STRING,
    ScheduleB STRING,
    ReturnRate FLOAT64,
    DefectReturnRate FLOAT64,
    prdsalesrank INT64,
    Tag STRING,
    MapEnforce INT64,
    PrdColor STRING,
    PrdParentSku STRING,
    FlatShip FLOAT64,
    ShortTitle STRING,
    weightship FLOAT64,
    Image360 STRING,
    LastupdateDate TIMESTAMP,
    Type STRING,
    Title2 STRING,
    Material STRING,
    ProductBags STRING,
    CTNPALLET INT64,
    InTheBox STRING,
    Reprice FLOAT64,
    sellChannelsRestrict STRING,
    AgeRange STRING,
    Gender STRING,
    LandedCost STRING,
    ProductStockDelayDays INT64,
    ProductOnOrderkDelayDays INT64,
    batteryRequiredMain STRING,
    batteryIncludedMain STRING,
    batteryRequiredNumMain INT64,
    batteryCompositionMain STRING,
    batteryTypeMain STRING,
    batteryVoltsMain FLOAT64,
    batterymAhMain FLOAT64,
    batteryWhMain FLOAT64,
    batteryNumCellsMain INT64,
    batteryWeightMain FLOAT64,
    batteryLitWeightMain FLOAT64,
    batteryRequiredAcc STRING,
    batteryIncludedAcc STRING,
    batteryRequiredNumAcc INT64,
    batteryCompositionAcc STRING,
    batteryTypeAcc STRING,
    batteryVoltsAcc FLOAT64,
    batterymAhAcc FLOAT64,
    batteryWhAcc FLOAT64,
    batteryNumCellsAcc INT64,
    batteryWeightAcc FLOAT64,
    batteryLitWeightAcc FLOAT64,
    BoxID STRING,
    idBuyer INT64,
    amazonDescription STRING,
    amazon_bullet_point1 STRING,
    amazon_bullet_point2 STRING,
    amazon_bullet_point3 STRING,
    amazon_bullet_point4 STRING,
    amazon_bullet_point5 STRING,
    ForceActive BOOLEAN DEFAULT FALSE,
    PalletPack INT64,
    TrailerPack INT64,
    targetDPCI STRING,
    isSentToGPA BOOLEAN,
    BuyerTag STRING,
    skuManager INT64,
    CampaignManager INT64,
    NewProductType STRING,
    NewProductStatus STRING,
    RemapSKU STRING,
    MasterCartonId STRING,
    InnerCartonId STRING,
    WarrantyId INT64,
    ComplianceCertificatesId STRING,
    BarCodeTypes STRING,
    GiftInsert STRING,
    HTSCode STRING,
    LinkToFiles STRING,
    ToolingFee STRING,
    LaunchDate STRING,
    LifeCycleNotes STRING,
    AmazonSellingPrice FLOAT64,
    Body_HTMlUpdate STRING,
    ReviewedByComplianceConsultant BOOLEAN,
    ConsultantCompany STRING,
    PPCStrategy	STRING,
    PPCStrategyNote STRING
);