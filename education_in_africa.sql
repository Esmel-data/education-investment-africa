-- Top 10 countries by average school life expectancy
SELECT
    country,
    ROUND(AVG(school_life_expectancy_avg), 2) AS avg_schooling_years
FROM education_in_africa
WHERE school_life_expectancy_avg IS NOT NULL
GROUP BY country
ORDER BY avg_schooling_years DESC
LIMIT 10;

-- Top 10 countries by educational efficiency (schooling/USD invested)
SELECT
    country,
    ROUND(AVG(schooling_return_per_usd), 4) AS avg_return_per_usd,
    ROUND(AVG(investment_total_usd_million), 2) AS avg_investment_usd,
    ROUND(AVG(school_life_expectancy_avg), 2) AS avg_schooling_years
FROM education_in_africa
WHERE schooling_return_per_usd IS NOT NULL
GROUP BY country
ORDER BY avg_return_per_usd DESC
LIMIT 10;

-- Average investment by education level across all countries
SELECT
    ROUND(AVG(investment_primary_usd_million), 2)   AS avg_investment_primary_usd,
    ROUND(AVG(investment_secondary_usd_million), 2) AS avg_investment_secondary_usd,
    ROUND(AVG(investment_tertiary_usd_million), 2)  AS avg_investment_tertiary_usd
FROM education_in_africa
WHERE investment_total_usd_million IS NOT NULL;

-- Top 10 countries by consolidated budget effort (average % GDP)
SELECT
    country,
    ROUND(AVG(investment_total_pct_gdp), 2)       AS avg_total_pct_gdp,
    ROUND(AVG(investment_primary_pct_gdp), 2)     AS avg_primary_pct_gdp,
    ROUND(AVG(investment_secondary_pct_gdp), 2)   AS avg_secondary_pct_gdp,
    ROUND(AVG(investment_tertiary_pct_gdp), 2)    AS avg_tertiary_pct_gdp
FROM education_in_africa
WHERE investment_total_pct_gdp IS NOT NULL
GROUP BY country
ORDER BY avg_total_pct_gdp DESC
LIMIT 10;

-- Countries where gender gap is most unfavorable to women
SELECT
    country,
    ROUND(AVG(gender_gap_schooling), 2)              AS avg_gender_gap,
    ROUND(AVG(school_life_expectancy_male), 2)        AS avg_schooling_male,
    ROUND(AVG(school_life_expectancy_female), 2)      AS avg_schooling_female
FROM education_in_africa
WHERE gender_gap_schooling IS NOT NULL
GROUP BY country
HAVING avg_gender_gap > 0
ORDER BY avg_gender_gap DESC
LIMIT 10;

-- Annual average evolution of total investment USD per country
SELECT
    country,
    YEAR(year)                                          AS year,
    ROUND(AVG(investment_total_usd_million), 2)         AS avg_investment_usd
FROM education_in_africa
WHERE investment_total_usd_million IS NOT NULL
GROUP BY country, YEAR(year)
ORDER BY country, year;

-- Dominant education level funded across the most countries
SELECT
    dominant_investment_level,
    COUNT(DISTINCT country) AS nb_countries
FROM education_in_africa
WHERE dominant_investment_level IS NOT NULL
GROUP BY dominant_investment_level
ORDER BY nb_countries DESC;

-- Average school life expectancy by budget effort category
select
    investment_level_category,
    COUNT(DISTINCT country)                          AS nb_countries,
    ROUND(AVG(school_life_expectancy_avg), 2)        AS avg_schooling_years,
    ROUND(AVG(investment_total_pct_gdp), 2)          AS avg_total_pct_gdp,
    ROUND(AVG(investment_total_usd_million), 2)      AS avg_total_usd
FROM education_in_africa
WHERE investment_level_category IS NOT NULL
  AND school_life_expectancy_avg IS NOT NULL
GROUP BY investment_level_category
ORDER BY avg_schooling_years DESC;

-- Gender parity progression between Phase 1 and Phase 2 
SELECT
    period,
    COUNT(DISTINCT country)                                                        AS nb_countries_total,
    SUM(CASE WHEN gender_parity_status = 'Parity achieved' THEN 1 ELSE 0 END)     AS nb_countries_parity,
    SUM(CASE WHEN gender_parity_status = 'Parity achieved' THEN 1 ELSE 0 END)
        / COUNT(DISTINCT country) * 100                                            AS pct_countries_parity
FROM education_in_africa
WHERE gender_parity_status IS NOT NULL
GROUP BY period
ORDER BY period;