/*
 Instructions:
    - Create a branch named "wine"
    - Solve the data-requests from this file using SQL.
    - Add/Commit/Push your changes to github (individual).
 Note: You can work along with your project team.
 */

-- EX.1) Get the top 10 countries with more population density

select name from country where area_km2 =0;

select
       name,
       population/area_km2 density
from country
where area_km2>0
order by density desc
limit 10
;

-- EX.2) Get the count of male/female tasters.
select distinct gender from taster;

select gender, count(*)
from taster
where lower(gender) in ('male', 'female')
    --lower(gender)! = 'undefinding'
group by gender
;

-- EX.3) Get the percentage of male/female tasters.

WITH taster_valid AS (
    SELECT
        *
    FROM
        taster
    WHERE
        LOWER(gender) IN ('male','female')
    ), taster_gender_agg AS (
    SELECT
        gender,
        COUNT(*)::NUMERIC(7,2) gender_sum
    FROM
          taster_valid
    GROUP BY
        gender
    ), taster_total AS (
        SELECT  count(*)::NUMERIC(7,2) total
    FROM
        taster_valid
    )
SELECT
     gender,
    trunc (100* gender_sum/ total,2) percentage
FROM
    taster_gender_agg,
    taster_total
;

-- EX.4) How many countries share the same first digit on their country-code?
-- Show only those digits with more than 20 countries.
select distinct left(code,1) from country;

select left(code,1) first_digit, count(*) country_count
from country
group by first_digit
having count(*)>20;

-- EX.5) Get the % of countries are not labeled as a trillion usd gdp and
-- do have a null happiness_score.
select count(*) from country;
select
    --split_part(gdp_usd, ' ',2)
    100* COUNT(*)/MAX(T.TOTAL) percentage
from country,
     (SELECT count(*) total FROM country) t
where
    --lower(split_part(gdp_usd,' ', 2)) != 'trillion'
    LOWER(gdp_usd) NOT LIKE '%trillon'
    AND happiness_score IS NULL
;


-- COUNTRY ANALYSIS

-- A) Get the average happiness_score of the countries labeled with a GDP
-- of "billion" and "trillion".
SELECT avg(happiness_score)
FROM country WHERE LOWER(split_part(gdp_usd, ' ', 2)) IN ('billion', 'trillion')
;


-- B) Show a table with the country name, population, area, gdp, and happiness core of the
-- the G7 countries (i.e., `Canada`, `France`, `Germany`, `Italy`, `Japan`, `United Kingdom`, `United States`)
-- order by happiness_score (DESC).
SELECT name, population, area_km2, gdp_usd, happiness_score
FROM country WHERE name IN ('Canada', 'France', 'Germany', 'Italy', 'Japan', 'United Kingdom', 'United States')
ORDER BY happiness_score DESC
;

-- C) Create a custom score called "score" using this formula: happiness_score * density
-- Where `density` is population / area_km2. Show the top 10 countries (name) with greater score.
WITH country_density AS (SELECT name, DIV(population, area_km2) AS "density"
FROM country
WHERE area_km2 > 0),

     country_score AS (SELECT name, happiness_score FROM country WHERE area_km2 > 0)

SELECT country_score.name, (country_score.happiness_score * country_density.density) AS score

FROM country_density, country_score

WHERE country_score.name = country_density.name

  AND (country_score.happiness_score * country_density.density) IS NOT NULL ORDER BY score DESC LIMIT 10
;

-- WINE ANALYSIS

-- D) Get the number of wines per variety, ordered by the latter (desc)
SELECT variety, count(variety) AS count_variety
FROM wine GROUP BY variety ORDER BY count_variety DESC
;

-- E) How many wines are registered per country? Show country name and number of wines, ordered by the latter (desc).
SELECT name, count(name) AS count_name
FROM wine JOIN country c on wine.country_id = c.id
GROUP BY name ORDER BY count_name DESC
;


-- REVIEW ANALYSIS

-- F) What's the average wine price and points per province?
-- Show the province, avg-price, avg-points when the avg-points are grater than 85.
-- Ordered by avg-price and then by avg-points.
SELECT province, avg(price) AS avg_price, avg(points) AS avg_points

FROM review

    JOIN wine w on review.wine_id = w.id

GROUP BY province

HAVING avg(points) > 85

ORDER BY avg_price DESC, avg_points DESC
;


-- G) What's the average wine price and points of the countries with more than a 7 in their happiness score?
-- Show the country, avg-price, avg-points.
-- Ordered by avg-points and then by avg-price.
SELECT name, avg(points) AS avg_points, avg(price) AS avg_price

FROM review

    JOIN wine w on review.wine_id = w.id

    JOIN country c on w.country_id = c.id

GROUP BY name, happiness_score

HAVING happiness_score > 7

ORDER BY avg_points DESC, avg_price DESC
;

-- H) What's the min, avg, and max wine points per taster gender (excluding undefined) and wine variety starting with "Cabernet".
-- Order by: variety, gender
SELECT variety, gender, min(points) AS min_points, avg(points) AS avg_points, max(points) AS max_points

FROM review

    JOIN wine w on review.wine_id = w.id

    JOIN taster t on review.taster_id = t.id

WHERE LOWER(gender) NOT IN ('undefined') AND variety LIKE 'Cabernet%'

GROUP BY variety, gender

ORDER BY variety, gender
;

-- I) Create the following custom score called "wine_quality_and_happiness_index": happiness_score * avg(points) / 100
-- Get the score per country and order by the value (desc).
SELECT name, (avg(happiness_score) * avg(points) / 100) AS wine_quality_and_happiness_index

FROM country

    JOIN wine w on country.id = w.country_id

    JOIN review r on w.id = r.wine_id

GROUP BY name

ORDER BY wine_quality_and_happiness_index DESC
;

