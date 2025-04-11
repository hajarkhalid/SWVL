SELECT 
    DATE_FORMAT(trip_date, '%H') AS hour, 
    COUNT(*) AS total_trip,
    ROUND(SUM(CASE WHEN trip_status = 'complete' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS total_trip_percentage
FROM trip_table
GROUP BY hour
ORDER BY total_trip_percentage DESC;
