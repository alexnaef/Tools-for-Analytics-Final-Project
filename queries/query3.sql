
WITH top_10_tree_zipcodes AS (
    SELECT 
        TRIM(zipcode) AS zipcode, 
        COUNT(tree_id) AS tree_count 
    FROM 
        trees 
    GROUP BY 
        zipcode 
    ORDER BY 
        tree_count DESC 
    LIMIT 10
)

SELECT 
    r.zipcode, 
    TO_CHAR(ROUND(AVG(r."2024-01-31")::numeric, 2), 'FM999,999,990.00') AS avg_rent
FROM 
    rents AS r
JOIN 
    top_10_tree_zipcodes AS t 
ON 
    TRIM(r.zipcode::VARCHAR) = t.zipcode
GROUP BY 
    r.zipcode, t.tree_count
ORDER BY 
    t.tree_count DESC

