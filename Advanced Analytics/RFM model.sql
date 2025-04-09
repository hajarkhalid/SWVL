SELECT
AVG(amount) AS monetary_value
COUNT(trip_id) AS frequency
DATEDIFF(NOW), MAX(trip_date)) AS 