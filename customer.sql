SELECT "Gender", COUNT(*) AS Count_Gender
FROM customers
GROUP BY "Gender";
-- Age bucketing
SELECT
    age_bucket,
    COUNT(*) AS count
FROM (
    SELECT
        *,
        CASE
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday) <= 18 THEN '<=18'
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday) BETWEEN 18 AND 25 THEN '18-25'
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday)  BETWEEN 25 AND 35 THEN '25-35'
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday)  BETWEEN 35 AND 45 THEN '35-45'
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday)  BETWEEN 45 AND 55 THEN '45-55'
            WHEN Extract (YEAR From order_date)-Extract(Year From birthday)  BETWEEN 55 AND 65 THEN '55-65'
            ELSE '>65'
        END AS age_bucket
    FROM overall
) AS age_groups
GROUP BY age_bucket;
-- countery wise customer count
SELECT 
   c."Continent",c."Country",c."State",c."City", 
   COUNT(c."CustomerKey") AS customer_count
FROM 
    customers c
GROUP BY 
   c."Continent",c."Country",c."State",c."City"
ORDER BY 
    customer_count DESC;