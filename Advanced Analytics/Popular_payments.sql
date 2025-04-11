SELECT payment_method, COUNT(*) AS total_number_of_payment_method
FROM payments
WHERE payment_status = 'Success'
GROUP BY payment_method
ORDER BY total_number_of_payment_method DESC;
