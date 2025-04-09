WITH cohort_data AS (
    SELECT
        DATE_FORMAT(u.registration_date, '%Y-%m') AS cohort_month,
        DATE_FORMAT(p.payment_date, '%Y-%m') AS payment_month,
        u.user_id,
        p.amount
    FROM user_table u
    LEFT JOIN payment p ON u.user_id = p.user_id
    AND p.payment_status = 'Success'
),
Cohort_aggregates AS (
    SELECT 
        cohort_month,
        TIMESTAMPDIFF(MONTH, MIN(cohort_month), payment_month) AS month_offset,
        SUM(amount) AS total_revenue,
        COUNT(DISTINCT user_id) AS total_users,
        COUNT(DISTINCT CASE WHEN payment_month = DATE_FORMAT(NOW(), '%Y-%m') THEN user_id END) AS active_users
    FROM cohort_data
    GROUP BY cohort_month, month_offset
)

SELECT 
    cohort_month,
    month_offset,
    total_users,
    total_revenue,
    ROUND((active_users / total_users) * 100, 2) AS retention_rate,
    ROUND(((total_users - active_users) / total_users) * 100, 2) AS churn_rate,
    ROUND(total_revenue / total_users, 2) AS avg_revenue_per_user
FROM Cohort_aggregates
ORDER BY cohort_month, month_offset;
