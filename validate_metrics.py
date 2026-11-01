"""Validate headline KPIs for the marketing campaign dataset."""
from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
DATA_PATH = ROOT / "data" / "KAG_conversion_data.csv"

def main():
    df = pd.read_csv(DATA_PATH)
    spend = df["Spent"].sum()
    impressions = df["Impressions"].sum()
    clicks = df["Clicks"].sum()
    total_conversions = df["Total_Conversion"].sum()
    approved = df["Approved_Conversion"].sum()

    print(f"Rows: {len(df):,}")
    print(f"Columns: {len(df.columns)}")
    print(f"Missing values: {int(df.isna().sum().sum())}")
    print(f"Duplicate rows: {int(df.duplicated().sum())}")
    print(f"Impressions: {int(impressions):,}")
    print(f"Clicks: {int(clicks):,}")
    print(f"Spend: ${spend:,.2f}")
    print(f"Total conversions: {int(total_conversions):,}")
    print(f"Approved conversions: {int(approved):,}")
    print(f"CTR: {100 * clicks / impressions:.4f}%")
    print(f"CPC: ${spend / clicks:.2f}")
    print(f"CPM: ${1000 * spend / impressions:.4f}")
    print(f"Total conversion rate: {100 * total_conversions / clicks:.2f}%")
    print(f"Cost per approved conversion: ${spend / approved:.2f}")

    print("\\nCost per approved conversion by campaign:")
    campaign = df.groupby("xyz_campaign_id").agg(
        spend=("Spent", "sum"),
        approved_conversions=("Approved_Conversion", "sum"),
    )
    campaign["cost_per_approved_conversion"] = (
        campaign["spend"] / campaign["approved_conversions"].replace(0, pd.NA)
    )
    print(campaign.round(2).to_string())

if __name__ == "__main__":
    main()
