CREATE TABLE Hospital_General_Information (facility_id TEXT,facility_name TEXT,address TEXT,city_tow


SELECT * 
FROM Hospital_General_Information
LIMIT 10;


SELECT facility_id, facility_name, city_town, state, hospital_type, hospital_ownersh, hospital_overa


SELECT COUNT(*) AS total_hospitals
FROM Hospital_General_Information;


SELECT state, COUNT(*) AS hospital_count
FROM Hospital_General_Information
GROUP BY state
Order BY hospital_count DESC;

SELECT hospital_overall AS rating, COUNT(*) AS county
FROM Hospital_General_Information
GROUP BY hospital_overall
ORDER BY rating;

SELECT 
    state,
    COUNT(*) AS total_hospitals,
    SUM(CASE WHEN hospital_overall NOT IN ('Not Available', '') THEN 1 ELSE 0 END) AS rated_hospitals,
    ROUND(AVG(CASE WHEN hospital_overall NOT IN ('Not Available', '') THEN CAST(hospital_overall AS FLOAT) END), 2) AS avg_rating
FROM Hospital_General_Information
GROUP BY state
ORDER BY avg_rating DESC;

SELECT 
    hospital_ownersh AS ownership_type,
    COUNT(*) AS total_hospitals,
    ROUND(AVG(CASE WHEN hospital_overall NOT IN ('Not Available', '') 
              THEN CAST(hospital_overall AS FLOAT) END), 2) AS avg_rating
FROM Hospital_General_Information
GROUP BY hospital_ownersh
ORDER BY avg_rating DESC;

SELECT 
    facility_name,
    city_town,
    hospital_type,
    hospital_ownersh,
    hospital_overall AS rating
FROM Hospital_General_Information
WHERE state = 'TX'
AND city_town IN ('HOUSTON', 'THE WOODLANDS', 'CONROE', 'KATY', 'SUGAR LAND', 'SPRING', 'HUMBLE')
ORDER BY rating DESC;

SELECT 
    facility_name,
    city_town,
    hospital_type,
    hospital_ownersh,
    hospital_overall AS rating
FROM Hospital_General_Information
WHERE state = 'TX'
AND city_town IN ('HOUSTON', 'THE WOODLANDS', 'CONROE', 'KATY', 'SUGAR LAND', 'SPRING', 'HUMBLE')
ORDER BY rating;

SELECT 
    hospital_ownersh,
    COUNT(*) AS total,
    ROUND(AVG(CASE WHEN hospital_overall NOT IN ('Not Available', '') 
              THEN CAST(hospital_overall AS FLOAT) END), 2) AS avg_rating
FROM Hospital_General_Information
WHERE state = 'TX'
GROUP BY hospital_ownersh
ORDER BY avg_rating DESC;
