SELECT 
    incident_zip AS zipcode, 
    COUNT(*) AS num_complaints
FROM 
    complaints
WHERE 
    created_date BETWEEN '2023-03-01' AND '2024-02-29' 
GROUP BY 
    incident_zip 
ORDER BY 
    num_complaints DESC