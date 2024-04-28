
SELECT 
    tree_id AS ID,
    spc_common AS species,
    health,
    status,
    ST_AsText(
        ST_SetSRID(
            ST_MakePoint(
                CAST(longitude AS DOUBLE PRECISION),
                CAST(latitude AS DOUBLE PRECISION)
            ), 4326
        )
    ) AS coordinate_location
FROM 
    trees
WHERE 
    ST_DWithin(
        ST_SetSRID(
            ST_MakePoint(
                CAST(longitude AS DOUBLE PRECISION),
                CAST(latitude AS DOUBLE PRECISION)
            ), 4326
        ),
        ST_SetSRID(
            ST_MakePoint(
                -73.96253174434912,
                40.80737875669467
            ), 4326
        ),
        804.67  -- ½ mile in meters
    )


