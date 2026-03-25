# education-investment-africa
Analytical dashboard exploring the relationship between public education spending and school life expectancy across 54 African countries (2010–2023) — Python · SQL · Power BI


# 🎓 Education Investment & School Life Expectancy in Africa (2010–2023)

> Analytical project exploring how public education investment drives school life
> expectancy across 54 African countries — built as a end-to-end data analyst portfolio piece.


## 1. Project Overview

African governments allocate public resources to education in highly variable
proportions, yet the link between investment levels and educational outcomes
remains rarely documented in a decision-ready format.

This project analyzes 54 African countries over 2010–2023 to answer one
central business question:

> To what extent does public investment in education — measured in absolute
> volume (USD) and as a share of GDP — determine school life expectancy, and
> how does this effect vary by country, education level, and gender?**

The deliverable is a 3-page interactive Power BI dashboard supported by a
full Python cleaning pipeline and 10 SQL analytical queries, designed for
non-technical decision-makers and education policy stakeholders.


## 2. Dataset

| Parameter        | Detail                                              |
|------------------|-----------------------------------------------------|
| Source       | World Bank — World Development Indicators           |
| File         | `Education_in_General.csv`                          |
| Rows         | 757 observations                                    |
| Columns      | 11 raw → 20 final (after feature engineering)       |
| Period       | 2010 – 2023 (14 years)                              |
| Countries    | 54 African countries                                |
| Missing data | Structural (~40–65% on some columns) — kept as NaN  |

Variable categories:

- `Identifiers` — country code, country name
- `Temporal` — year, period (Phase 1 / Phase 2)
- `Schooling` — school life expectancy by gender and average
- `Investment (USD)` — public spending by education level in USD millions
- `Investment (% GDP)` — budgetary effort by education level
- `Engineered features` — gender gap, parity status, efficiency ratio,
   total investment, budget intensity category, dominant level


## 3. Tools & Technologies

| Tool | Role in pipeline |
|------|-----------------|
| Python (pandas, numpy) | Data loading, quality audit, cleaning, feature engineering, CSV export |
| MySQL Workbench | Data storage, 10 analytical SQL queries, decision-oriented analysis |
| Power BI Desktop | 3-page interactive dashboard, 20+ DAX measures, slicers and KPI cards |
| Gamma | Executive presentation summarizing key insights for stakeholders |


## 4. Project Steps

1. Data loading & exploration (Python)
Loaded the World Bank CSV with proper handling of `#N/B` missing value codes.
Audited variable types, missing value rates per column, and outliers using the
IQR method.

2. Cleaning & standardization (Python)
Converted `Year` to datetime for Power BI time series compatibility. Renamed
all 11 columns to business-friendly `snake_case` labels readable by
non-technical audiences. Rounded all numeric columns to 2 decimal places for
clean MySQL `DECIMAL` storage. Capped GDP % outliers at IQR upper bound to
prevent visual distortions in Power BI, while preserving absolute USD outliers
(South Africa, Ethiopia, Morocco) as legitimate large-economy values.

3. Feature engineering (Python)
Built 9 business variables absent from the raw dataset:
average school life expectancy, gender gap, gender parity status, total
investment in USD and % GDP, budget intensity category (Low / Medium / High),
educational efficiency ratio (schooling years per USD million invested),
dominant education level funded, and period segmentation (Phase 1 / Phase 2).

4. SQL analysis (MySQL Workbench)
Wrote and executed 10 analytical queries covering: top countries by schooling, educational
efficiency rankings, investment breakdown by level, Phase 1 vs Phase 2
progression, GDP effort ranking, gender gap analysis, annual investment
trends, dominant level distribution, investment-schooling relationship by
budget category, and gender parity progression over time.

5. Decision dashboard (Power BI)
Built a 3-page dashboard with 20+ DAX measures, 6 slicers, and 15+ visuals
including KPI cards, choropleth map, scatter plot (investment vs schooling),
clustered bar charts (gender comparison), line charts (temporal trends), and
donut charts (level distribution). Designed for autonomous reading by managers
without technical accompaniment.

6. Executive presentation (Gamma)
Summarized the 5 key business recommendations into a shareable slide deck for
education policy stakeholders and recruiting audiences.


## 5. Dashboard 

The dashboard is structured across 3 thematic pages:

- Page 1 — Continental Overview : Top 15 countries by schooling,
  choropleth map, continental time trend 2010–2023, 4 KPI cards
- Page 2 — Investment & Efficiency : Scatter plot (investment vs
  schooling), grouped bar chart by education level, efficiency ranking,
  budget intensity donut chart
- Page 3 — Gender & Temporal Evolution : Gender gap ranking, H vs F
  clustered bar chart, parity progression Phase 1 → Phase 2, multi-line
  time series


## 6. Key Results & Insights

1. Investment level directly drives schooling outcomes
Countries with high budgetary effort (>4% GDP) average 11.8 years of
school life expectancy vs 8.2 years for low-effort countries — a 3.6-year
gap that confirms the central project hypothesis.

2. Primary education absorbs 47% of budgets, tertiary only 15%
The structural under-financing of tertiary education across 57% of African
countries limits the development of a knowledge economy and higher-skill
workforce.

3. Rwanda is the continent's efficiency model
Rwanda combines growing investment (+69% from 2010 to 2020) with consistent
schooling gains (+1 year between Phase 1 and Phase 2), making it the most
replicable policy model for Sub-Saharan Africa.

4. Gender parity improved but remains incomplete
The share of countries achieving gender parity rose from 47% (Phase 1)
to 57% (Phase 2) — a +10 point gain. Chad, Niger, and Mali remain
critical outliers with gaps above 1.5 years in favor of boys.

5. North Africa leads, Sub-Saharan Africa shows strong variance
Morocco, Tunisia, and Algeria consistently top continental schooling rankings,
while Sub-Saharan outcomes range from Rwanda (12.1 years) to Chad (6.7 years)
— a 5.4-year continental gap that policy investment can meaningfully reduce.


## 7. How to Run

### Steps
```
1. Clone this repository
   git clone https://github.com/your-username/education-investment-africa.git

2. Place Education_in_General.csv in the project root folder

3. Run the Python notebooks in order:
   01_quality_audit.ipynb
   02_type_conversion.ipynb
   03_renaming.ipynb
   04_feature_engineering.ipynb
   05_variable_selection.ipynb

4. Import into MySQL using the connection script:
   06_sql_import.py
   (update host / user / password / database in the script)

5. Open MySQL Workbench and run queries from:
   07_analytical_queries.sql

6. Open Power BI Desktop 
   Import table : Education_in_General.XLS

7. Paste DAX measures from 08_dax_measures.txt into Power BI
   Modeling → New Measure
```

### Dataset

The dataset is sourced from the World Bank Open Data platform and is
publicly available at:
🔗 [https://data.worldbank.org/indicator](https://data.worldbank.org/indicator)

Search indicators:
- `SE.SCH.LIFE` — School life expectancy
- `SE.XPD.PRIM.ZS` — Government expenditure on primary education (% of GDP)
- `SE.XPD.SECO.ZS` — Government expenditure on secondary education (% of GDP)
- `SE.XPD.TERT.ZS` — Government expenditure on tertiary education (% of GDP)


## Author

ESMEL
Data Analyst | Python · SQL · Power BI
🔗 [LinkedIn](www.linkedin.com/in/esmel-amari)
📧 esmelphilamari@gmail.com
