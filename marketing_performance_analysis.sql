SELECT *
FROM marketing_ads
LIMIT 20;

-- 2. Data quality checks
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ad_id) AS distinct_ads,
    SUM(ad_id IS NULL) AS null_ad_ids,
    SUM(age IS NULL) AS null_age,
    SUM(gender IS NULL) AS null_gender,
    SUM(Impressions IS NULL) AS null_impressions,
    SUM(Clicks IS NULL) AS null_clicks,
    SUM(Spent IS NULL) AS null_spend,
    SUM(Total_Conversion IS NULL) AS null_total_conversions,
    SUM(Approved_Conversion IS NULL) AS null_approved_conversions
FROM marketing_ads;

SELECT
    ad_id,
    COUNT(*) AS row_count
FROM marketing_ads
GROUP BY ad_id
HAVING COUNT(*) > 1;

SELECT
    SUM(Impressions = 0) AS zero_impression_rows,
    SUM(Clicks = 0) AS zero_click_rows,
    SUM(Spent = 0) AS zero_spend_rows,
    SUM(Approved_Conversion = 0) AS zero_approved_conversion_rows
FROM marketing_ads;

-- 3. Overall performance KPIs
SELECT
    SUM(Impressions) AS total_impressions,
    SUM(Clicks) AS total_clicks,
    ROUND(SUM(Spent), 2) AS total_spend,
    SUM(Total_Conversion) AS total_conversions,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0), 4) AS ctr_pct,
    ROUND(SUM(Spent) / NULLIF(SUM(Clicks), 0), 2) AS cpc,
    ROUND(1000.0 * SUM(Spent) / NULLIF(SUM(Impressions), 0), 4) AS cpm,
    ROUND(100.0 * SUM(Total_Conversion) / NULLIF(SUM(Clicks), 0), 2) AS total_conversion_rate_pct,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads;

-- 4. Campaign-level performance
SELECT
    xyz_campaign_id,
    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    ROUND(SUM(Spent), 2) AS spend,
    SUM(Total_Conversion) AS total_conversions,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0), 4) AS ctr_pct,
    ROUND(SUM(Spent) / NULLIF(SUM(Clicks), 0), 2) AS cpc,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads
GROUP BY xyz_campaign_id
ORDER BY cost_per_approved_conversion;

-- 5. Audience performance by gender
SELECT
    gender,
    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    ROUND(SUM(Spent), 2) AS spend,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0), 4) AS ctr_pct,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads
GROUP BY gender
ORDER BY cost_per_approved_conversion;

-- 6. Audience performance by age group
SELECT
    age,
    SUM(Impressions) AS impressions,
    SUM(Clicks) AS clicks,
    ROUND(SUM(Spent), 2) AS spend,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(100.0 * SUM(Clicks) / NULLIF(SUM(Impressions), 0), 4) AS ctr_pct,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads
GROUP BY age
ORDER BY cost_per_approved_conversion;

-- 7. Campaign x gender comparison
SELECT
    xyz_campaign_id,
    gender,
    SUM(Spent) AS spend,
    SUM(Clicks) AS clicks,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads
GROUP BY xyz_campaign_id, gender
ORDER BY xyz_campaign_id, cost_per_approved_conversion;

-- 8. Window function: rank campaigns by cost per approved conversion
WITH campaign_kpis AS (
    SELECT
        xyz_campaign_id,
        SUM(Spent) AS spend,
        SUM(Approved_Conversion) AS approved_conversions,
        SUM(Clicks) AS clicks,
        SUM(Impressions) AS impressions
    FROM marketing_ads
    GROUP BY xyz_campaign_id
)
SELECT
    xyz_campaign_id,
    ROUND(spend, 2) AS spend,
    approved_conversions,
    ROUND(spend / NULLIF(approved_conversions, 0), 2) AS cost_per_approved_conversion,
    DENSE_RANK() OVER (
        ORDER BY spend / NULLIF(approved_conversions, 0)
    ) AS efficiency_rank
FROM campaign_kpis
ORDER BY efficiency_rank;

-- 9. Interest-level performance
SELECT
    interest,
    COUNT(*) AS ad_records,
    SUM(Spent) AS spend,
    SUM(Clicks) AS clicks,
    SUM(Approved_Conversion) AS approved_conversions,
    ROUND(SUM(Spent) / NULLIF(SUM(Approved_Conversion), 0), 2) AS cost_per_approved_conversion
FROM marketing_ads
GROUP BY interest
ORDER BY cost_per_approved_conversion;
