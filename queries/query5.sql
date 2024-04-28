
SELECT 
    z.zipcode, 
    COUNT(t.tree_id) AS tree_count 
FROM 
    trees AS t
JOIN 
    zipcodes AS z
ON 
    t.zipcode = z.zipcode
GROUP BY 
    z.zipcode
ORDER BY 
    tree_count DESC 
LIMIT 10

