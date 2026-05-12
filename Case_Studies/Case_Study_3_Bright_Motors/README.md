Bright Motors Car Sales Analysis
• Overview
This repository tells the story of Bright Motors, a dealership navigating growth and profitability challenges. With a new Head of Sales in place, the project was designed to uncover insights from historical car sales data. By combining SQL analytics, data cleaning, dashboards, and business storytelling, the analysis highlights where Bright Motors wins, where it struggles, and how it can sharpen its strategy.

• Objectives
The analysis was guided by five central questions:
• What car makes, models, and body types generate the most revenue
• Where the strongest regions for sales and revenue are located
• How price, mileage, and year of manufacture interact
• When sales peak across months, weeks, and hours of the day
• Why customer preferences are shifting and what trends to act on
• Tools & Workflow

The journey from raw data to insights relied on:
• Databricks and SQL for cleaning and transformation
• Google Looker Studio, Power BI, and Excel for visualization
• PowerPoint for executive storytelling
• Miro for planning and architecture diagrams
• Project Architecture

The project followed a clear path from source to presentation:
• Source: Bright Car Sales dataset in CSV/Excel format
• ETL Pipeline: duplicates removed, missing values handled, numeric conversions applied, and new fields created such as total revenue
• Storage: cleaned data housed in Databricks
• Analysis Layer: SQL queries grouped by make, model, year, region, and fuel type
• Visualization Layer: dashboards built in Looker Studio and Power BI
• Presentation Layer: insights summarized in slides for decision‑makers
• Headline KPIs

The scale of Bright Motors’ operations is captured in a few numbers:
• 559K transactions recorded
• $8B total revenue generated
• 38 regions covered nationwide
• 57 makes, 852 models, and 46 body types sold
• 14K sellers participated in the market
• Regional Performance

The geography of sales reveals anchor markets and growth opportunities:
• Florida and California lead with over $1B each in revenue
• Pennsylvania, Texas, and Georgia complete the top five
• Together, the top five states drive half of total revenue
• Mid‑tier states like NJ, IL, OH, and TN offer expansion potential
• Winning Makes, Models & Body Types
The product mix shows clear leaders and a long tail:
• Ford dominates with $1.35B revenue, nearly double Chevrolet
• F‑150 and Altima stand out as top models
• Sedans and SUVs deliver $5.2B, about two‑thirds of revenue
• The long list of 46 body types adds little return and needs rationalization
• Customer Preferences

Patterns in buyer choices reveal strong preferences:
• Black, white, and grey/silver cars generate over 70% of revenue
• Automatic transmission accounts for nearly 85% of sales
• Mid‑priced cars ($10K–$20K) dominate with 40.7% of sales
• Premium tier cars above $20K add another 20.6%
• Price, Mileage & Condition

Mileage and condition shape resale value:
• The sweet spot lies between 20K–60K miles
• Cars in good condition (30K–99K km) generate half of revenue
• Newer cars under 30K km add another 40%
• High‑mileage vehicles over 100K km contribute less than 10%
• Timing of Sales

Sales timing reveals when demand is strongest:
• Revenue peaks in January and February, exceeding $2B
• Weekly sales concentrate mid‑week, from Wednesday to Friday
• Overnight sales dominate, with 72.8% closing at midnight or dawn
• Emerging Trends

The future of Bright Motors is shaped by new patterns:
• Newer model years (2010+) are rising sharply in sales
• Older inventory before 2000 delivers little revenue and high mileage
• Top 10 sellers supply over 130K units, making partnerships critical
• Recommendations

The path forward is clear and actionable:
• Expand dealerships in PA, TX, GA, and NJ
• Focus inventory on Ford, Chevrolet, Nissan, and Toyota in Sedan and SUV categories
• Stock vehicles in the 20K–60K mileage band, model years 2010+, and neutral colors
• Align marketing with January–February, mid‑week, and overnight sales flows
• Strengthen partnerships with top wholesalers to secure volume
• Phase out high‑mileage and pre‑2000 inventory to protect margins
• Repository Contents

The repository includes all supporting files:
• Bright_Car_Sales_Dashboard(DataStudio)_Final.pdf – dashboard visuals
• BrightMotors_CarSales_CaseStudy.pdf – case study brief and instructions
• BrightMotors_CarSales_Presentation_Final.pptx – executive presentation
• car_sales_queries.sql – SQL scripts for analysis
• car_sales_processed.xlsx – cleaned dataset for visualization
• Acknowledgements

This project was made possible through:
• Dataset provided by BrightLearn
• Analysis and presentation prepared by Thulasizwe John Buthelezi
• Tools including Databricks, SQL, Power BI, Looker Studio, Miro, and PowerPoint