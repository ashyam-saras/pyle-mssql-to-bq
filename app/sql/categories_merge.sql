-- Create main table if not exists
CREATE TABLE IF NOT EXISTS {bq_project}.{bq_dataset}.{table_name} (
    idCategory INT64,
    CategoryDesc STRING,
    idParentCategory INT64,
    displayOrder INT64,
    active INT64,
    imageCategory STRING,
    CAtegoryDetail STRING,
    PageTitle STRING,
    MetaTag STRING,
    MetaDesc STRING,
    siteMapHedder STRING,
    SiteMapDesc STRING,
    ImageBanner STRING,
    H1Headline STRING,
    H2Headline STRING,
    ogType STRING,
    ogTitle STRING,
    ogDesc STRING,
    H1Desc STRING,
    H2Desc STRING
);

-- Merge data from temp table to main table
MERGE {bq_project}.{bq_dataset}.{table_name} AS MAIN
USING {bq_project}.{bq_dataset}.{temp_table_name} AS TEMP
ON MAIN.idCategory = TEMP.idCategory
WHEN MATCHED THEN
    UPDATE SET
        MAIN.idCategory = TEMP.idCategory,
        MAIN.CategoryDesc = TEMP.CategoryDesc,
        MAIN.idParentCategory = TEMP.idParentCategory,
        MAIN.displayOrder = TEMP.displayOrder,
        MAIN.active = TEMP.active,
        MAIN.imageCategory = TEMP.imageCategory,
        MAIN.CAtegoryDetail = TEMP.CAtegoryDetail,
        MAIN.PageTitle = TEMP.PageTitle,
        MAIN.MetaTag = TEMP.MetaTag,
        MAIN.MetaDesc = TEMP.MetaDesc,
        MAIN.siteMapHedder = TEMP.siteMapHedder,
        MAIN.SiteMapDesc = TEMP.SiteMapDesc,
        MAIN.ImageBanner = TEMP.ImageBanner,
        MAIN.H1Headline = TEMP.H1Headline,
        MAIN.H2Headline = TEMP.H2Headline,
        MAIN.ogType = TEMP.ogType,
        MAIN.ogTitle = TEMP.ogTitle,
        MAIN.ogDesc = TEMP.ogDesc,
        MAIN.H1Desc = TEMP.H1Desc,
        MAIN.H2Desc = TEMP.H2Desc
WHEN NOT MATCHED THEN
INSERT VALUES (
    TEMP.idCategory,
    TEMP.CategoryDesc,
    TEMP.idParentCategory,
    TEMP.displayOrder,
    TEMP.active,
    TEMP.imageCategory,
    TEMP.CAtegoryDetail,
    TEMP.PageTitle,
    TEMP.MetaTag,
    TEMP.MetaDesc,
    TEMP.siteMapHedder,
    TEMP.SiteMapDesc,
    TEMP.ImageBanner,
    TEMP.H1Headline,
    TEMP.H2Headline,
    TEMP.ogType,
    TEMP.ogTitle,
    TEMP.ogDesc,
    TEMP.H1Desc,
    TEMP.H2Desc
)
