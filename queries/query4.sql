
WITH avg_rent_by_zip AS (
    SELECT 
        CAST(zipcode AS VARCHAR) AS zipcode,
        AVG(CAST(r."2024-01-31" AS NUMERIC)) AS avg_rent_raw,
        TO_CHAR(ROUND(AVG(CAST(r."2024-01-31" AS NUMERIC)), 2), 'FM999,999,990.00') AS avg_rent_formatted
    FROM 
        rents as R
    GROUP BY 
        zipcode
),

lowest_rent_zipcodes AS (
    SELECT 
        zipcode,
        avg_rent_raw,
        avg_rent_formatted
    FROM 
        avg_rent_by_zip 
    ORDER BY 
        avg_rent_raw 
    LIMIT 5
),

highest_rent_zipcodes AS (
    SELECT 
        zipcode,
        avg_rent_raw,
        avg_rent_formatted
    FROM 
        avg_rent_by_zip 
    ORDER BY 
        avg_rent_raw DESC 
    LIMIT 5
),

combined_rent_zipcodes AS (
    SELECT * FROM lowest_rent_zipcodes
    UNION ALL
    SELECT * FROM highest_rent_zipcodes
)

SELECT 
    c.zipcode,
    c.avg_rent_formatted AS avg_rent,
    COALESCE(t.tree_count, 0) AS tree_count,
    COALESCE(com.complaint_count, 0) AS complaint_count
FROM 
    combined_rent_zipcodes AS c
LEFT JOIN 
    (SELECT TRIM(CAST(zipcode AS VARCHAR)) AS zipcode, COUNT(*) AS tree_count FROM trees GROUP BY zipcode) AS t 
ON 
    c.zipcode = t.zipcode
LEFT JOIN 
    (SELECT TRIM(CAST(incident_zip AS VARCHAR)) AS zipcode, COUNT(*) AS complaint_count FROM complaints WHERE created_date BETWEEN '2024-01-01' AND '2024-01-31' GROUP BY incident_zip) AS com 
ON 
    c.zipcode = com.zipcode
ORDER BY 
    c.avg_rent_raw ASC


