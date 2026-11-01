# Marketing Performance & Growth Analytics

<p align="center">
  <img src="https://img.shields.io/badge/Marketing-Analytics-8B72BE?style=for-the-badge" alt="Marketing Analytics"/>
  <img src="https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Power_BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" alt="Power BI"/>
  <img src="https://img.shields.io/badge/Python-Validation-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
</p>

## 📌 Project Overview

This project analyzes paid advertising performance to understand which campaign IDs and audience segments deliver approved conversions more efficiently. The workflow uses SQL for aggregation and KPI analysis, with Python used to validate headline metrics from the source CSV.


## 🎯 Business Questions

- Which campaign has the lowest cost per approved conversion?
- How do campaign IDs compare on spend, impressions, clicks, and conversions?
- How do performance metrics differ by gender and age group?
- What are the overall CTR, CPC, CPM, conversion rate, and cost per approved conversion?
- Which segments should be reviewed before budget is reallocated?


## 📊 Headline Results


| KPI | Result |
|---|---:|
| Total impressions | 213,434,828 |
| Total clicks | 38,165 |
| Total ad spend | $58,705.23 |
| Total conversions | 3,264 |
| Approved conversions | 1,079 |
| Overall CTR | 0.018% |
| Overall CPC | $1.54 |
| Overall CPM | $0.275 |
| Total conversion rate (total conversions / clicks) | 8.55% |
| Overall cost per approved conversion | $54.41 |

### Campaign Comparison

| Campaign ID | Spend | Impressions | Clicks | Approved conversions | CTR | Cost per approved conversion |
|---:|---:|---:|---:|---:|---:|---:|
| 916 | $149.71 | 482,925 | 113 | 24 | 0.023% | $6.24 |
| 936 | $2,893.37 | 8,128,187 | 1,984 | 183 | 0.024% | $15.81 |
| 1178 | $55,662.15 | 204,823,716 | 36,068 | 872 | 0.018% | $63.83 |

### Audience Comparison by Gender

| Gender | Spend | Approved conversions | Cost per approved conversion |
|---|---:|---:|---:|
| F | $34,502.62 | 495 | $69.70 |
| M | $24,202.61 | 584 | $41.44 |

## 💡 Key Insights

- **Lowest cost per approved conversion:** campaign `916` at **$6.24**.
- **Highest cost per approved conversion:** campaign `1178` at **$63.83**.
- Overall CTR is **0.018%**, while average CPC is **$1.54**.
- In the supplied data, gender-level cost per approved conversion is **$41.44 for M** and **$69.70 for F**.
- Campaign-level efficiency should be evaluated alongside conversion volume and sample size. A low cost in a small campaign does not automatically mean it can scale profitably.

## 📈 Recommended Dashboard Pages

1. **Executive Overview:** spend, impressions, clicks, CTR, CPC, total conversions, approved conversions, cost per approved conversion.
2. **Campaign Performance:** compare campaign IDs by spend, CTR, CPC, conversion volume, and cost per approved conversion.
3. **Audience Analysis:** age and gender breakdowns with approved conversion cost.
4. **Conversion Funnel:** impressions → clicks → total conversions → approved conversions, using clearly defined rates.

## 🧠 Business Recommendations

- Investigate why campaign `916` has a low cost per approved conversion and assess whether it has enough volume to scale.
- Review campaign `1178` for targeting, creative, placement, and conversion-quality issues before increasing spend.
- Compare age and gender segments using both cost efficiency and conversion volume; do not make budget decisions from cost alone.
- Track approved conversions as the primary outcome if they represent the business's qualified result.
- Confirm metric definitions with the business owner before comparing these results with live ad-platform dashboards.


## ⚠️ Metric Definitions

- **CTR:** clicks / impressions × 100
- **CPC:** spend / clicks
- **CPM:** spend / impressions × 1,000
- **Total conversion rate:** total conversions / clicks × 100
- **Cost per approved conversion:** spend / approved conversions


## 👩‍💻 Author

**Marwa Samy** · [GitHub](https://github.com/marwa23-rgb)
