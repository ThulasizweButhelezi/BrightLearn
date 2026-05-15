# Bright Motors — Car Sales Analysis

**Prepared by:** Thulasizwe John Buthelezi | BrightLearn Programme

---

## Overview

This repository tells the story of Bright Motors, a multi-region car dealership navigating growth and profitability challenges. With a new Head of Sales in place, the project was designed to uncover insights from historical car sales data. By combining SQL analytics, data cleaning, dashboards, and business storytelling, the analysis highlights where Bright Motors wins, where it struggles, and how it can sharpen its strategy.

---

## Business Background

Bright Motors is a multi-region car dealership selling new and used vehicles across 38 regions. A new Head of Sales has been appointed with a mandate to expand the dealership network, lift sales performance, and optimise inventory. The Bright Car Sales dataset captures daily transactional and pricing data across 559,000 vehicle sales. This analysis translates that historical data into actionable insights to guide future sales and marketing strategy.

---

## Objectives

The analysis was guided by five central questions framed as:

| # | Question |
|---|---|
| **WHAT** | Which car makes, models, and body types generate the most revenue? |
| **WHERE** | Which regions deliver the highest sales volume and revenue? |
| **HOW** | How are price, mileage, and year of manufacture related? |
| **WHEN** | What seasonal, weekly, and time-of-day patterns drive sales? |
| **WHY** | What emerging customer preferences should we lean into? |

---

## Tools & Workflow

| Purpose | Tool |
|---|---|
| Planning & Architecture | Miro |
| Data Processing & Transformation | Databricks, SQL |
| Visualization & Dashboarding | Google Looker Studio, Power BI, Excel |
| Presentation | PowerPoint |

---

## Project Architecture

The project followed a clear path from source to insight:

**Source** → Raw Bright Car Sales dataset (CSV/Excel format)

**ETL Pipeline** → Duplicates removed, missing values handled, numeric conversions applied, new fields derived (e.g., `Total_Revenue`, `Car_Condition`, `Time_Bucket`, `SellingPrice_Category`)

**Storage** → Cleaned data housed in Databricks

**Analysis Layer** → SQL queries grouped by make, model, year, region, condition, and price tier

**Visualization Layer** → Dashboards built in Looker Studio and Power BI

**Presentation Layer** → Insights summarised in slides for the Head of Sales

---

## Headline KPIs

| Metric | Value |
|---|---|
| Total Transactions | 559K |
| Total Revenue | $8B |
| Regions Covered | 38 |
| Distinct Car Makes | 57 |
| Distinct Car Models | 852 |
| Distinct Body Types | 46 |
| Distinct Colours | 21 |
| Distinct Interior Types | 18 |
| Distinct Transmission Types | 3 |
| Total Sellers | 14K |

---

## Dashboard Insights

### 1. Regional Performance

| State | Revenue Tier |
|---|---|
| Florida | ~$1.1B — #1 anchor market |
| California | ~$1.05B — #2 anchor market |
| Pennsylvania | Top 5 — expansion candidate |
| Texas | Top 5 — expansion candidate |
| Georgia | Top 5 — expansion candidate |

- The top 5 states drive approximately **50% of total revenue**.
- Mid-tier states — NJ, IL, OH, and TN — round out the top 10 and offer meaningful growth potential.

### 2. Winning Makes, Models & Body Types

**By Make (Revenue)**
- Ford leads with ~**$1.35B** — nearly double Chevrolet in second place.
- Top 10 makes: Ford, Chevrolet, Nissan, Toyota, BMW, Mercedes-Benz, Dodge, Infiniti, Honda, Lexus.

**By Model (Revenue)**
- Top models: F-150, Altima, Escape, Fusion, G Sedan, Explorer, Camry, 3 Series, Edge, Silverado 1500.

**By Body Type (Revenue)**
- Sedan and SUV together deliver approximately **$5.2B (~65% of total revenue)**.
- The long tail of 46 body types produces minimal returns and is a prime candidate for rationalisation.

**By Make (Sales Volume)**
- Top 10 by units: Ford, Chevrolet, Nissan, Toyota, Dodge, Honda, Hyundai, BMW, Kia, Chrysler.
- Top models by volume: Altima, F-150, Camry, Fusion, Escape, Focus, Accord, Impala, 3 Series, Grand Caravan.

### 3. Customer Preferences

**Colour**
- Black, White, and Gray/Silver generate over **70% of revenue** — neutral colours dominate buyer preference.

**Transmission**
- Automatic: **84.7%** of revenue | **85.2%** of sales volume.
- Manual: a niche **2.6%** of revenue / **3.1%** of sales.
- Unknown: **12.7%** revenue / **11.7%** sales.

**Price Tiers (Sales Volume)**

| Price Category | Share of Sales |
|---|---|
| Medium ($10,001–$20,000) | 40.7% |
| High (>$20,000) | 20.6% |
| Low ($5,000–$10,000) | 20.5% |
| Very Low (<$5,000) | 18.1% |

### 4. Price, Mileage & Condition

**Revenue by Condition / Mileage**

| Condition | Mileage Band | Revenue Share |
|---|---|---|
| Good | 30,000–99,000 km | 49.9% |
| New | <30,000 km | 40.6% |
| High Mileage | 100,000–199,000 km | 8.7% |
| Old | 200,000+ km | 0.7% |

- The sweet spot for resale value lies between **20K–60K miles** — revenue peaks in this mileage band on the scatter plot.
- Together, Good and New condition vehicles account for **~90% of total revenue**.
- High-mileage and aged inventory (>100K km) deliver less than 10% — reducing sourcing exposure here protects margins.

### 5. Timing of Sales

**Monthly (Revenue)**
- Revenue peaks in **February and January** (exceeding $2B combined), then falls sharply through April.
- Front-loading marketing investment in Q1 maximises capture of the demand spike.

**Day of Week (Sales Volume)**
- Wednesday leads, followed by Tuesday, Thursday, and Friday.
- Saturday and Sunday are the lowest-performing days — staffing and promotions should be concentrated mid-week.

**Time of Day (Sales Volume)**

| Time Slot | Share of Sales |
|---|---|
| Midnight / Dawn | 72.8% |
| Morning (5–11 AM) | 21.2% |
| Afternoon (12–17 PM) | 5.7% |
| Evening (18–23 PM) | 0.2% |

- Over **72%** of sales close at midnight or dawn, consistent with wholesale/auction-style transaction flows.
- Investing in 24/7 listing infrastructure and automated overnight processing is a high-priority action.

### 6. Emerging Trends

- **Newer model years (2010+)** are accelerating sharply in both sales volume and average revenue, while average mileage trends downward — buyers are moving toward younger stock.
- **Older inventory (pre-2000)** peaks at ~175K km average mileage and contributes very little revenue — aggressive sourcing in this segment should be phased out.
- **Top 10 sellers** (Nissan Infiniti LT, Ford Motor Credit, The Hertz Corporation, Santander Consumer, Avis Corporation, Wells Fargo Dealer Services, TDAF Remarketing, GE Fleet Services, Enterprise Vehicle Exchange, JPMorgan Chase Bank) supply over **130K units** — deepening these partnerships is critical to volume and margin security.

---

## Recommendations

| # | Recommendation | Rationale |
|---|---|---|
| 01 | **Expand dealership footprint** | Open or franchise in PA, TX, GA, and NJ — proven demand in top-10 revenue states with headroom to grow. |
| 02 | **Rationalise inventory mix** | Lead with Ford, Chevrolet, Nissan, and Toyota in Sedan and SUV body types — together over 60% of revenue. |
| 03 | **Stock the resale sweet spot** | Prioritise vehicles with 20K–60K miles, model years 2010+, in black/white/grey — aligned with actual buyer behaviour. |
| 04 | **Time the marketing calendar** | Concentrate campaigns in January–February, Wednesday–Friday, with always-on overnight listings — when 70%+ of sales close. |
| 05 | **Deepen seller partnerships** | Negotiate preferred-supply agreements with top 10 wholesalers to lock in volume and margin. |
| 06 | **Phase out low-margin tail** | Reduce sourcing of high-mileage (>100K km) and pre-2000 inventory — under 10% of revenue and a drag on working capital. |

---

## Repository Contents

```
Bright_Motors_Car_Sales_Analysis/
├── dashboard/
│   └── Bright_Car_Sales_Dashboard_DataStudio_Final.pdf
├── presentation/
│   └── BrightMotors_CarSales_Presentation_Final.pptx
├── data/
│   └── Car_Sales_Final_Summary.xlsx
├── queries/
│   └── car_sales_queries.sql
└── README.md
```

---

## Acknowledgements

- **Dataset** provided by BrightLearn
- **Analysis and presentation** prepared by Thulasizwe John Buthelezi
- **Tools used:** Databricks, SQL, Google Looker Studio, Power BI, Excel, Miro, PowerPoint

---

*BrightLearn Programme | Bright Motors Car Sales Analysis*