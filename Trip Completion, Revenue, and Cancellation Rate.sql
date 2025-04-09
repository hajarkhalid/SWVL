-- Query: Trip Completion, Revenue, and Cancellation Rate
-- Description: This query calculates the completion percentage, revenue, and cancellation rate.
SELECT
    COUNT(*) AS total_trips,
    AVG(amount) AS avg_total_spent,
    SUM(amount) AS total_revenue,
    SUM(amount) / COUNT(*) AS avg_payment_per_trip, -- Calculating average payment per trip
    SUM(amount) / COUNT(DISTINCT t.user_id) AS avg_payment_per_user, -- Calculating avg payment per user
    SUM(CASE WHEN trip_status = 'Complete' THEN 1 ELSE 0 END) AS completed_trips,
    SUM(CASE WHEN trip_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_trips,
    ROUND(SUM(CASE WHEN trip_status = 'Cancelled' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS cancellation_rate
FROM trips_table t
LEFT JOIN payments p 
    ON t.trip_id = p.trip_id
    AND t.user_id = p.user_id
ORDER BY total_revenue DESC;
