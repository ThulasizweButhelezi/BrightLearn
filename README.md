# Bright Coffee Shop — Sales Analysis Case Study 1

**Prepared by:** Thulasizwe Buthelezi | BrightLearn Programme | 2026

---

## Purpose

Bright Coffee Shop has appointed a new CEO focused on growing revenue and improving product performance through data-driven decision-making. This case study tasks a Junior Data Analyst with extracting actionable insights from historical daily sales data (January–June 2026) across all three New York locations to support that goal.

---

## Business Background

**The Business:** Bright Coffee Shop operates 3 locations across New York — Lower Manhattan, Hell's Kitchen, and Astoria. The product portfolio spans beverages, bakery, and branded merchandise.

**The CEO Challenge:** A newly appointed CEO is tasked with growing revenue and improving product performance. Data-driven insights are needed to guide key decisions.

**The Objective:** Identify which products generate the most revenue, determine peak trading hours, uncover trends across time, and provide strategic recommendations.

---

## Dataset Overview

| Metric | Value |
|---|---|
| Stores | 3 (Lower Manhattan, Hell's Kitchen, Astoria) |
| Product Categories | 9 |
| Product Types | 29 |
| Total Transactions | 148,702 rows |
| Total Units Sold | 214,470 |
| Total Revenue | $698,812.33 |
| Period Covered | January – June 2026 |

---

## Tools & Platforms

| Purpose | Tool |
|---|---|
| Data Planning & Architecture | Miro, Canva |
| Data Processing & Transformation | Databricks, SQL |
| Data Analysis & Dashboarding | Excel |
| Presentation | PowerPoint, Canva |

---

## Key Tasks

### 1. Planning & Architecture (Miro / Canva)
- Design a data flow diagram showing data sources, ETL process, storage, and analysis layers.
- Define key metrics and calculations (e.g., `total_revenue = unit_price × quantity`).

### 2. Data Processing (Databricks / SQL)
- Clean and transform the raw dataset.
- Create time-bucket columns (e.g., Early Morning, Morning, Midday/Lunch, Afternoon, Evening).
- Compute total revenue and group data by product, location, and time.

### 3. Data Analysis (Data studio)
Build dashboards and pivot tables covering:
- Revenue per product category and product type
- Peak time intervals by day and time slot
- Quantity sold by category
- Best-selling and lowest-performing products
- Monthly and quarterly revenue trends

### 4. Presentation to the CEO
Prepare a methodology document and visual presentation summarising key insights and strategic recommendations.

---

## Dashboard Insights

### 1. Overall Revenue Performance
- **Total revenue:** $698,812.33 over six months (Jan–Jun 2026).
- **Trend:** Revenue grew from $81.7K in January, dipped slightly in February (~$76.1K), then surged steadily — reaching ~$166.5K in June, a **2× increase** from the January figure.

### 2. Product Category Performance

| Category | Revenue | % of Total |
|---|---|---|
| Coffee | $269,952 | 38.6% |
| Tea | $196,406 | 28.1% |
| Bakery | $82,316 | 11.8% |
| Drinking Chocolate | $72,416 | 10.4% |
| Coffee Beans | $40,085 | 5.7% |
| Branded | $13,607 | 1.9% |
| Loose Tea | $11,214 | 1.6% |
| Flavours | $8,409 | 1.2% |
| Packaged Chocolate | $4,408 | 0.6% |

- **Top performers:** Coffee and Tea together account for ~66.7% of total revenue. At product type level, Barista Espresso and Brewed Chai Tea lead the chart.
- **Low performers:** Branded items, Loose Tea, Flavours, and Packaged Chocolate each contribute under $14K and are prime candidates for promotional campaigns or menu rationalisation.

### 3. Time-of-Day Performance

| Time Slot | Revenue | % of Total |
|---|---|---|
| Morning | $220,162 | 31.5% |
| Afternoon | $164,295 | 23.5% |
| Early Morning | $146,226 | 20.9% |
| Evening | $87,569 | 12.5% |
| Midday / Lunch | $80,560 | 11.5% |

- Morning is consistently the highest-revenue period across **every day of the week**.
- **Saturday morning** is the single highest-revenue time slot overall.
- Evening and Midday/Lunch are the weakest periods, presenting opportunities for targeted time-specific campaigns.

### 4. Day-of-Week Performance

| Day | Revenue | % of Total |
|---|---|---|
| Monday | $101,677 | 14.6% |
| Friday | $101,373 | 14.5% |
| Thursday | $100,768 | 14.4% |
| Wednesday | $100,314 | 14.4% |
| Tuesday | $99,456 | 14.2% |
| Sunday | $98,330 | 14.1% |
| Saturday | $96,894 | 13.9% |

- Weekdays are marginally stronger than weekends, with Monday leading.
- Saturday and Sunday are the lowest-earning days — ideal for weekend-specific promotions or events.

### 5. Store Location Performance

| Location | Revenue | % of Total | Units Sold |
|---|---|---|---|
| Hell's Kitchen | $236,511 | 33.8% | 71,737 |
| Astoria | $232,244 | 33.2% | 70,991 |
| Lower Manhattan | $230,057 | 32.9% | 71,742 |

- All three locations contribute almost equally (~33% each) to both sales and revenue — a sign of healthy geographic balance.
- Hell's Kitchen holds a slight edge in revenue; operational or marketing practices there could be studied and replicated across other locations.

### 6. Sales vs Revenue Relationship
- There is a **strong positive linear correlation** between units sold and revenue generated.
- High-volume products reliably drive higher revenue — volume is the primary growth lever.
- Products in the lower-left cluster of the scatter plot are high in quantity but low in unit price, highlighting a pricing opportunity.

---

## Recommendations for the CEO

| # | Recommendation | Rationale |
|---|---|---|
| 01 | **Maximise Coffee & Tea Revenue** | Together they represent ~66.7% of revenue. Invest in premium variants, cold brew options, and seasonal specials to grow the core. |
| 02 | **Capitalise on Morning Traffic** | Morning is consistently the top time slot. Launch AM loyalty stamps, breakfast combos, and pre-order options to capture more spend. |
| 03 | **Revive Under-Performing Products** | Branded goods, Flavours, and Packaged Chocolate are near zero. Run targeted discounts or replace with higher-margin alternatives. |
| 04 | **Leverage Equal Location Footprint** | All 3 stores contribute ~33% each. Roll out a cross-location loyalty app and use best-store learnings to raise the floor. |
| 05 | **Automate Reporting & Set Targets** | Implement a daily automated dashboard and monthly revenue KPIs per location so the CEO can track progress in real time. |

---

## Next Steps

**Short Term (0–3 months)**
- Automate the daily sales reporting pipeline
- Launch a morning loyalty reward programme
- Run targeted promotions on low-performing categories

**Medium Term (3–6 months)**
- Deploy per-location KPI dashboards
- Expand seasonal Coffee & Tea offerings
- Introduce bundle deals for slow afternoon and midday slots

**Long Term (6–12 months)**
- Data-driven expansion planning for new locations
- Build customer segmentation models from loyalty data
- Integrate real-time inventory management
