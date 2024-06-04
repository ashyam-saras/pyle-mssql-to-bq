-- Create main table if not exists
CREATE TABLE IF NOT EXISTS {bq_project}.{bq_dataset}.{table_name} (
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
    ConsultantCompany STRING
);

-- Merge data from temp table to main table
MERGE {bq_project}.{bq_dataset}.{table_name} AS MAIN
USING {bq_project}.{bq_dataset}.{temp_table_name} AS TEMP
ON MAIN.idProduct = TEMP.idProduct
WHEN MATCHED THEN
    UPDATE SET
        MAIN.idProduct = TEMP.idProduct,
        MAIN.idwarehouse = TEMP.idwarehouse,
        MAIN.idSupplier = TEMP.idSupplier,
        MAIN.description = TEMP.description,
        MAIN.details = TEMP.details,
        MAIN.Mcategory = TEMP.Mcategory,
        MAIN.Category = TEMP.Category,
        MAIN.Subcategory = TEMP.Subcategory,
        MAIN.price = TEMP.price,
        MAIN.listPrice = TEMP.listPrice,
        MAIN.corpPrice = TEMP.corpPrice,
        MAIN.listOnePrice = TEMP.listOnePrice,
        MAIN.listTwoPrice = TEMP.listTwoPrice,
        MAIN.listThreePrice = TEMP.listThreePrice,
        MAIN.bToBPrice = TEMP.bToBPrice,
        MAIN.Image = TEMP.Image,
        MAIN.imageUrl = TEMP.imageUrl,
        MAIN.smallImageUrl = TEMP.smallImageUrl,
        MAIN.sku = TEMP.sku,
        MAIN.stock = TEMP.stock,
        MAIN.listHidden = TEMP.listHidden,
        MAIN.weight = TEMP.weight,
        MAIN.deliveringTime = TEMP.deliveringTime,
        MAIN.active = TEMP.active,
        MAIN.hotDeal = TEMP.hotDeal,
        MAIN.cost = TEMP.cost,
        MAIN.scost = TEMP.scost,
        MAIN.visits = TEMP.visits,
        MAIN.sales = TEMP.sales,
        MAIN.emailText = TEMP.emailText,
        MAIN.stockLevelAlert = TEMP.stockLevelAlert,
        MAIN.formQuantity = TEMP.formQuantity,
        MAIN.showInHome = TEMP.showInHome,
        MAIN.dateAdded = TEMP.dateAdded,
        MAIN.hasPersonalization = TEMP.hasPersonalization,
        MAIN.freeShipping = TEMP.freeShipping,
        MAIN.isBundleMain = TEMP.isBundleMain,
        MAIN.bonusPoints = TEMP.bonusPoints,
        MAIN.searchKeywords = TEMP.searchKeywords,
        MAIN.length = TEMP.length,
        MAIN.width = TEMP.width,
        MAIN.height = TEMP.height,
        MAIN.rental = TEMP.rental,
        MAIN.stockSecurity = TEMP.stockSecurity,
        MAIN.stockCostOrder = TEMP.stockCostOrder,
        MAIN.stockDelay = TEMP.stockDelay,
        MAIN.stockMinimumOrder = TEMP.stockMinimumOrder,
        MAIN.brand = TEMP.brand,
        MAIN.series = TEMP.series,
        MAIN.sug = TEMP.sug,
        MAIN.pack = TEMP.pack,
        MAIN.packed = TEMP.packed,
        MAIN.introduction = TEMP.introduction,
        MAIN.accessories = TEMP.accessories,
        MAIN.specification = TEMP.specification,
        MAIN.condition = TEMP.condition,
        MAIN.manual = TEMP.manual,
        MAIN.year = TEMP.year,
        MAIN.warranty = TEMP.warranty,
        MAIN.refurbished = TEMP.refurbished,
        MAIN.myProductNotes = TEMP.myProductNotes,
        MAIN.replacements = TEMP.replacements,
        MAIN.externalLink = TEMP.externalLink,
        MAIN.searchsku = TEMP.searchsku,
        MAIN.upc = TEMP.upc,
        MAIN.dummyField = TEMP.dummyField,
        MAIN.PGMASTERID = TEMP.PGMASTERID,
        MAIN.image2 = TEMP.image2,
        MAIN.image2Desc = TEMP.image2Desc,
        MAIN.image3 = TEMP.image3,
        MAIN.image3Desc = TEMP.image3Desc,
        MAIN.image4 = TEMP.image4,
        MAIN.image4Desc = TEMP.image4Desc,
        MAIN.BuyCat = TEMP.BuyCat,
        MAIN.EbayCat = TEMP.EbayCat,
        MAIN.osCat = TEMP.osCat,
        MAIN.iskit = TEMP.iskit,
        MAIN.reservedQty = TEMP.reservedQty,
        MAIN.tempStock = TEMP.tempStock,
        MAIN.GBHeight = TEMP.GBHeight,
        MAIN.GBWidth = TEMP.GBWidth,
        MAIN.GBDepth = TEMP.GBDepth,
        MAIN.GBWeight = TEMP.GBWeight,
        MAIN.prdUnitWeight = TEMP.prdUnitWeight,
        MAIN.MCHeight = TEMP.MCHeight,
        MAIN.MCWidth = TEMP.MCWidth,
        MAIN.MCDepth = TEMP.MCDepth,
        MAIN.MCGWeight = TEMP.MCGWeight,
        MAIN.Cuft = TEMP.Cuft,
        MAIN.Catalog = TEMP.Catalog,
        MAIN.ExpCost = TEMP.ExpCost,
        MAIN.Asin = TEMP.Asin,
        MAIN.MapPrice = TEMP.MapPrice,
        MAIN.OperFreq = TEMP.OperFreq,
        MAIN.bullet_point1 = TEMP.bullet_point1,
        MAIN.bullet_point2 = TEMP.bullet_point2,
        MAIN.bullet_point3 = TEMP.bullet_point3,
        MAIN.bullet_point4 = TEMP.bullet_point4,
        MAIN.bullet_point5 = TEMP.bullet_point5,
        MAIN.search_terms1 = TEMP.search_terms1,
        MAIN.search_terms2 = TEMP.search_terms2,
        MAIN.search_terms3 = TEMP.search_terms3,
        MAIN.search_terms4 = TEMP.search_terms4,
        MAIN.search_terms5 = TEMP.search_terms5,
        MAIN.CreatedBy = TEMP.CreatedBy,
        MAIN.Size = TEMP.Size,
        MAIN.isPart = TEMP.isPart,
        MAIN.UPCType = TEMP.UPCType,
        MAIN.DateAvailable = TEMP.DateAvailable,
        MAIN.isGift = TEMP.isGift,
        MAIN.Figth = TEMP.Figth,
        MAIN.Fight = TEMP.Fight,
        MAIN.WhoAdded = TEMP.WhoAdded,
        MAIN.AddedFrom = TEMP.AddedFrom,
        MAIN.CountryOrigin = TEMP.CountryOrigin,
        MAIN.Bag = TEMP.Bag,
        MAIN.TYPE1 = TEMP.TYPE1,
        MAIN.TYPE2 = TEMP.TYPE2,
        MAIN.`GROUP` = TEMP.`GROUP`,
        MAIN.ScheduleB = TEMP.ScheduleB,
        MAIN.ReturnRate = TEMP.ReturnRate,
        MAIN.DefectReturnRate = TEMP.DefectReturnRate,
        MAIN.prdsalesrank = TEMP.prdsalesrank,
        MAIN.Tag = TEMP.Tag,
        MAIN.MapEnforce = TEMP.MapEnforce,
        MAIN.PrdColor = TEMP.PrdColor,
        MAIN.PrdParentSku = TEMP.PrdParentSku,
        MAIN.FlatShip = TEMP.FlatShip,
        MAIN.ShortTitle = TEMP.ShortTitle,
        MAIN.weightship = TEMP.weightship,
        MAIN.Image360 = TEMP.Image360,
        MAIN.LastupdateDate = TEMP.LastupdateDate,
        MAIN.Type = TEMP.Type,
        MAIN.Title2 = TEMP.Title2,
        MAIN.Material = TEMP.Material,
        MAIN.ProductBags = TEMP.ProductBags,
        MAIN.CTNPALLET = TEMP.CTNPALLET,
        MAIN.InTheBox = TEMP.InTheBox,
        MAIN.Reprice = TEMP.Reprice,
        MAIN.sellChannelsRestrict = TEMP.sellChannelsRestrict,
        MAIN.AgeRange = TEMP.AgeRange,
        MAIN.Gender = TEMP.Gender,
        MAIN.LandedCost = TEMP.LandedCost,
        MAIN.ProductStockDelayDays = TEMP.ProductStockDelayDays,
        MAIN.ProductOnOrderkDelayDays = TEMP.ProductOnOrderkDelayDays,
        MAIN.batteryRequiredMain = TEMP.batteryRequiredMain,
        MAIN.batteryIncludedMain = TEMP.batteryIncludedMain,
        MAIN.batteryRequiredNumMain = TEMP.batteryRequiredNumMain,
        MAIN.batteryCompositionMain = TEMP.batteryCompositionMain,
        MAIN.batteryTypeMain = TEMP.batteryTypeMain,
        MAIN.batteryVoltsMain = TEMP.batteryVoltsMain,
        MAIN.batterymAhMain = TEMP.batterymAhMain,
        MAIN.batteryWhMain = TEMP.batteryWhMain,
        MAIN.batteryNumCellsMain = TEMP.batteryNumCellsMain,
        MAIN.batteryWeightMain = TEMP.batteryWeightMain,
        MAIN.batteryLitWeightMain = TEMP.batteryLitWeightMain,
        MAIN.batteryRequiredAcc = TEMP.batteryRequiredAcc,
        MAIN.batteryIncludedAcc = TEMP.batteryIncludedAcc,
        MAIN.batteryRequiredNumAcc = TEMP.batteryRequiredNumAcc,
        MAIN.batteryCompositionAcc = TEMP.batteryCompositionAcc,
        MAIN.batteryTypeAcc = TEMP.batteryTypeAcc,
        MAIN.batteryVoltsAcc = TEMP.batteryVoltsAcc,
        MAIN.batterymAhAcc = TEMP.batterymAhAcc,
        MAIN.batteryWhAcc = TEMP.batteryWhAcc,
        MAIN.batteryNumCellsAcc = TEMP.batteryNumCellsAcc,
        MAIN.batteryWeightAcc = TEMP.batteryWeightAcc,
        MAIN.batteryLitWeightAcc = TEMP.batteryLitWeightAcc,
        MAIN.BoxID = TEMP.BoxID,
        MAIN.idBuyer = TEMP.idBuyer,
        MAIN.amazonDescription = TEMP.amazonDescription,
        MAIN.amazon_bullet_point1 = TEMP.amazon_bullet_point1,
        MAIN.amazon_bullet_point2 = TEMP.amazon_bullet_point2,
        MAIN.amazon_bullet_point3 = TEMP.amazon_bullet_point3,
        MAIN.amazon_bullet_point4 = TEMP.amazon_bullet_point4,
        MAIN.amazon_bullet_point5 = TEMP.amazon_bullet_point5,
        MAIN.ForceActive = TEMP.ForceActive,
        MAIN.PalletPack = TEMP.PalletPack,
        MAIN.TrailerPack = TEMP.TrailerPack,
        MAIN.targetDPCI = TEMP.targetDPCI,
        MAIN.isSentToGPA = TEMP.isSentToGPA,
        MAIN.BuyerTag = TEMP.BuyerTag,
        MAIN.skuManager = TEMP.skuManager,
        MAIN.CampaignManager = TEMP.CampaignManager,
        MAIN.NewProductType = TEMP.NewProductType,
        MAIN.NewProductStatus = TEMP.NewProductStatus,
        MAIN.RemapSKU = TEMP.RemapSKU,
        MAIN.MasterCartonId = TEMP.MasterCartonId,
        MAIN.InnerCartonId = TEMP.InnerCartonId,
        MAIN.WarrantyId = TEMP.WarrantyId,
        MAIN.ComplianceCertificatesId = TEMP.ComplianceCertificatesId,
        MAIN.BarCodeTypes = TEMP.BarCodeTypes,
        MAIN.GiftInsert = TEMP.GiftInsert,
        MAIN.HTSCode = TEMP.HTSCode,
        MAIN.LinkToFiles = TEMP.LinkToFiles,
        MAIN.ToolingFee = TEMP.ToolingFee,
        MAIN.LaunchDate = TEMP.LaunchDate,
        MAIN.LifeCycleNotes = TEMP.LifeCycleNotes,
        MAIN.AmazonSellingPrice = TEMP.AmazonSellingPrice,
        MAIN.Body_HTMlUpdate = TEMP.Body_HTMlUpdate,
        MAIN.ReviewedByComplianceConsultant = TEMP.ReviewedByComplianceConsultant,
        MAIN.ConsultantCompany = TEMP.ConsultantCompany
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.idProduct,
    TEMP.idwarehouse,
    TEMP.idSupplier,
    TEMP.description,
    TEMP.details,
    TEMP.Mcategory,
    TEMP.Category,
    TEMP.Subcategory,
    TEMP.price,
    TEMP.listPrice,
    TEMP.corpPrice,
    TEMP.listOnePrice,
    TEMP.listTwoPrice,
    TEMP.listThreePrice,
    TEMP.bToBPrice,
    TEMP.Image,
    TEMP.imageUrl,
    TEMP.smallImageUrl,
    TEMP.sku,
    TEMP.stock,
    TEMP.listHidden,
    TEMP.weight,
    TEMP.deliveringTime,
    TEMP.active,
    TEMP.hotDeal,
    TEMP.cost,
    TEMP.scost,
    TEMP.visits,
    TEMP.sales,
    TEMP.emailText,
    TEMP.stockLevelAlert,
    TEMP.formQuantity,
    TEMP.showInHome,
    TEMP.dateAdded,
    TEMP.hasPersonalization,
    TEMP.freeShipping,
    TEMP.isBundleMain,
    TEMP.bonusPoints,
    TEMP.searchKeywords,
    TEMP.length,
    TEMP.width,
    TEMP.height,
    TEMP.rental,
    TEMP.stockSecurity,
    TEMP.stockCostOrder,
    TEMP.stockDelay,
    TEMP.stockMinimumOrder,
    TEMP.brand,
    TEMP.series,
    TEMP.sug,
    TEMP.pack,
    TEMP.packed,
    TEMP.introduction,
    TEMP.accessories,
    TEMP.specification,
    TEMP.condition,
    TEMP.manual,
    TEMP.year,
    TEMP.warranty,
    TEMP.refurbished,
    TEMP.myProductNotes,
    TEMP.replacements,
    TEMP.externalLink,
    TEMP.searchsku,
    TEMP.upc,
    TEMP.dummyField,
    TEMP.PGMASTERID,
    TEMP.image2,
    TEMP.image2Desc,
    TEMP.image3,
    TEMP.image3Desc,
    TEMP.image4,
    TEMP.image4Desc,
    TEMP.BuyCat,
    TEMP.EbayCat,
    TEMP.osCat,
    TEMP.iskit,
    TEMP.reservedQty,
    TEMP.tempStock,
    TEMP.GBHeight,
    TEMP.GBWidth,
    TEMP.GBDepth,
    TEMP.GBWeight,
    TEMP.prdUnitWeight,
    TEMP.MCHeight,
    TEMP.MCWidth,
    TEMP.MCDepth,
    TEMP.MCGWeight,
    TEMP.Cuft,
    TEMP.Catalog,
    TEMP.ExpCost,
    TEMP.Asin,
    TEMP.MapPrice,
    TEMP.OperFreq,
    TEMP.bullet_point1,
    TEMP.bullet_point2,
    TEMP.bullet_point3,
    TEMP.bullet_point4,
    TEMP.bullet_point5,
    TEMP.search_terms1,
    TEMP.search_terms2,
    TEMP.search_terms3,
    TEMP.search_terms4,
    TEMP.search_terms5,
    TEMP.CreatedBy,
    TEMP.Size,
    TEMP.isPart,
    TEMP.UPCType,
    TEMP.DateAvailable,
    TEMP.isGift,
    TEMP.Figth,
    TEMP.Fight,
    TEMP.WhoAdded,
    TEMP.AddedFrom,
    TEMP.CountryOrigin,
    TEMP.Bag,
    TEMP.TYPE1,
    TEMP.TYPE2,
    TEMP.GROUP,
    TEMP.ScheduleB,
    TEMP.ReturnRate,
    TEMP.DefectReturnRate,
    TEMP.prdsalesrank,
    TEMP.Tag,
    TEMP.MapEnforce,
    TEMP.PrdColor,
    TEMP.PrdParentSku,
    TEMP.FlatShip,
    TEMP.ShortTitle,
    TEMP.weightship,
    TEMP.Image360,
    TEMP.LastupdateDate,
    TEMP.Type,
    TEMP.Title2,
    TEMP.Material,
    TEMP.ProductBags,
    TEMP.CTNPALLET,
    TEMP.InTheBox,
    TEMP.Reprice,
    TEMP.sellChannelsRestrict,
    TEMP.AgeRange,
    TEMP.Gender,
    TEMP.LandedCost,
    TEMP.ProductStockDelayDays,
    TEMP.ProductOnOrderkDelayDays,
    TEMP.batteryRequiredMain,
    TEMP.batteryIncludedMain,
    TEMP.batteryRequiredNumMain,
    TEMP.batteryCompositionMain,
    TEMP.batteryTypeMain,
    TEMP.batteryVoltsMain,
    TEMP.batterymAhMain,
    TEMP.batteryWhMain,
    TEMP.batteryNumCellsMain,
    TEMP.batteryWeightMain,
    TEMP.batteryLitWeightMain,
    TEMP.batteryRequiredAcc,
    TEMP.batteryIncludedAcc,
    TEMP.batteryRequiredNumAcc,
    TEMP.batteryCompositionAcc,
    TEMP.batteryTypeAcc,
    TEMP.batteryVoltsAcc,
    TEMP.batterymAhAcc,
    TEMP.batteryWhAcc,
    TEMP.batteryNumCellsAcc,
    TEMP.batteryWeightAcc,
    TEMP.batteryLitWeightAcc,
    TEMP.BoxID,
    TEMP.idBuyer,
    TEMP.amazonDescription,
    TEMP.amazon_bullet_point1,
    TEMP.amazon_bullet_point2,
    TEMP.amazon_bullet_point3,
    TEMP.amazon_bullet_point4,
    TEMP.amazon_bullet_point5,
    TEMP.ForceActive,
    TEMP.PalletPack,
    TEMP.TrailerPack,
    TEMP.targetDPCI,
    TEMP.isSentToGPA,
    TEMP.BuyerTag,
    TEMP.skuManager,
    TEMP.CampaignManager,
    TEMP.NewProductType,
    TEMP.NewProductStatus,
    TEMP.RemapSKU,
    TEMP.MasterCartonId,
    TEMP.InnerCartonId,
    TEMP.WarrantyId,
    TEMP.ComplianceCertificatesId,
    TEMP.BarCodeTypes,
    TEMP.GiftInsert,
    TEMP.HTSCode,
    TEMP.LinkToFiles,
    TEMP.ToolingFee,
    TEMP.LaunchDate,
    TEMP.LifeCycleNotes,
    TEMP.AmazonSellingPrice,
    TEMP.Body_HTMlUpdate,
    TEMP.ReviewedByComplianceConsultant,
    TEMP.ConsultantCompany
)
