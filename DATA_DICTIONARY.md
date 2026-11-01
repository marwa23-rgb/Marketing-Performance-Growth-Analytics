# Data Dictionary

The table below describes the columns present in `KAG_conversion_data.csv`.

| Column | Meaning | Type in source CSV |
|---|---|---|
| `ad_id` | Identifier for an ad record | Integer |
| `xyz_campaign_id` | Anonymized campaign identifier | Integer |
| `fb_campaign_id` | Facebook campaign identifier from the source dataset | Integer |
| `age` | Audience age band | Text |
| `gender` | Audience gender category (`M` / `F` in this file) | Text |
| `interest` | Numeric audience-interest code | Integer |
| `Impressions` | Number of ad impressions | Integer |
| `Clicks` | Number of clicks | Integer |
| `Spent` | Amount spent on the ad record | Decimal |
| `Total_Conversion` | Total conversions attributed in the source data | Integer |
| `Approved_Conversion` | Approved conversions attributed in the source data | Integer |

## Derived Metrics

| Metric | Formula |
|---|---|
| CTR (%) | `SUM(Clicks) / SUM(Impressions) * 100` |
| CPC | `SUM(Spent) / SUM(Clicks)` |
| CPM | `SUM(Spent) / SUM(Impressions) * 1000` |
| Total conversion rate (%) | `SUM(Total_Conversion) / SUM(Clicks) * 100` |
| Cost per approved conversion | `SUM(Spent) / SUM(Approved_Conversion)` |

**Caution:** campaign IDs and interest codes are numeric identifiers, not meaningful labels. Do not assign campaign names or interpret interest codes without a source mapping. Metrics are undefined where their denominator is zero.
