SELECT user_id, COUNT(trip_id) AS total_number_of_trips
FROM user_table u
LEFT JOIN trip_table t
ON u.user_id = t.user_id
GROUP BY user_id
ORDER BY total_number_of_trips DESC;