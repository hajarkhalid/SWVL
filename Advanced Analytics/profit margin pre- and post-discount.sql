SELECT
    DATE_TRUNC(payment_date, 'MONTH') AS month,  -- Group by the month of the payment date
    SUM(amount) AS total_revenue,  -- Sum of all payments made
    SUM(amount) - SUM(cost) AS profit_margin  -- Profit margin = total revenue - cost
FROM user_table
WHERE order_date BETWEEN '2024-03-01' AND '2024-05-31'
GROUP BY month  -- Group by the month of the payment date
ORDER BY month;
