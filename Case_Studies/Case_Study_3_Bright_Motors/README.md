Bright Motors Car Sales Analysis

 Overview: 
This repository documents the Bright Motors Car Sales Analysis project, a data‑driven case study designed to support the newly appointed Head of Sales.
The project combines data engineering, SQL analytics, dashboard visualization, and business storytelling to deliver actionable insights for dealership growth, inventory optimization, and profitability.
---
Objectives
The analysis set out to answer five key business questions:
• What: Which car makes, models, and body types generate the most revenue?
• Where: Which regions deliver the highest sales volume and revenue?
• How: How are price, mileage, and year of manufacture related?
• When: What seasonal, weekly, and time‑of‑day patterns drive sales timing?
• Why: What emerging customer preferences should Bright Motors lean into?
---
Tools & Workflow
• Data Processing: Databricks / SQL (ETL, cleaning, transformations)
• Visualization: Google Looker Studio, Power BI, Excel
• Presentation: PowerPoint (business insights for executives)
• Planning: Miro (architecture and workflow diagrams)
---
Project Architecture
1. Source: Bright Car Sales dataset (Excel/CSV)
2. ETL Pipeline:
	◦ Removed duplicates and handled missing values
	◦ Converted text‑based prices into numeric format
	◦ Created calculated fields (e.g., total_revenue = selling_price × units_sold)
3. Storage: SQL database (Snowflake / Databricks)
4. Analysis Layer: SQL queries grouped by make, model, year, region, fuel type
5. Visualization Layer: Interactive dashboards in Looker Studio & Power BI
6. Presentation Layer: Executive summary slides for decision‑makers
---
 Headline KPIs
• 559K transactions
• $8B total revenue
• 38 regions covered
• 57 distinct makes, 852 models, 46 body types
• 14K sellers participated
---
 Regional Performance
• Florida and California lead in both revenue (~$1.1B & $1.05B) and sales volume.
• Pennsylvania, Texas, and Georgia round out the top 5.
• Top 5 states drive ~50% of total revenue → expansion opportunities in mid‑tier states (NJ, IL, OH, TN).
---
 Winning Makes, Models & Body Types
• Ford dominates with ~$1.35B revenue (almost 2× Chevrolet).
• Top models: F‑150 and Altima.
• Sedan & SUV body types deliver ~$5.2B (~65% of total revenue).
• Long tail of 46 body types contributes minimal returns → rationalize inventory.
---
Customer Preferences
• Colors: Black, white, and grey/silver generate 70%+ of revenue.
• Transmission: Automatic accounts for 84.7% of revenue; manual is niche.
• Price tiers: Mid‑priced cars ($10K–$20K) dominate at 40.7% of sales; premium tier (> $20K) adds 20.6%.
---
Price, Mileage & Condition
• Optimal resale band: 20K–60K miles.
• “Good condition” (30K–99K km) generates 49.9% of revenue; “New” (<30K km) adds 40.6%.
• High‑mileage vehicles (>100K km) deliver <10% of revenue → reduce exposure.
---
Timing of Sales
• Revenue peaks in Jan–Feb (> $2B), then declines through April.
• Weekly sales concentrate Wednesday–Friday; weekends are weak.
• 72.8% of sales close overnight (midnight/dawn) → auction‑style flows dominate.
---
 Emerging Trends
• Sales of newer model years (2010+) are accelerating while average mileage trends down.
• Older inventory (pre‑2000, avg mileage ~175K km) generates minimal revenue.
• Top 10 sellers (e.g., Nissan Infiniti LT, Ford Motor Credit, Hertz, Santander, Avis) supply >130K units → deepen partnerships.
---
 Recommendations
1. Expand dealership footprint in PA, TX, GA, NJ.
2. Rationalize inventory mix: focus on Ford, Chevrolet, Nissan, Toyota in Sedan & SUV.
3. Stock the resale sweet spot: 20K–60K miles, model years 2010+, neutral colors.
4. Time marketing campaigns: front‑load in Jan–Feb, Wed–Fri, with overnight listings.
5. Deepen seller partnerships: negotiate preferred‑supply agreements with top wholesalers.
6. Phase out low‑margin tail: reduce sourcing of high‑mileage and pre‑2000 inventory.
---
Repository Contents
• Bright_Car_Sales_Dashboard(DataStudio)_Final.pdf → Interactive dashboard visuals
• BrightMotors_CarSales_CaseStudy.pdf → Case study brief and instructions
• BrightMotors_CarSales_Presentation_Final.pptx → Executive presentation with insights
• car_sales_queries.sql → SQL scripts for data processing and analysis
• car_sales_processed.xlsx → Cleaned dataset for visualization
---
Acknowledgements
• Dataset provided by BrightLearn.
• Analysis and presentation prepared by Thulasizwe John Buthelezi.
• Tools: Databricks, SQL, Power BI, Looker Studio, Miro, PowerPoint.