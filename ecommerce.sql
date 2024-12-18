*/Validating Buisness*/

SELECT 
    customer_unique_id,
    COUNT(customer_id) AS visit_count
FROM customer
GROUP BY customer_unique_id
HAVING COUNT(customer_id) > 1;

WITH visit_counts AS (
    SELECT 
        customer_unique_id, 
        COUNT(customer_id) AS visit_count
    FROM customer
    GROUP BY customer_unique_id
)
SELECT 
    COUNT(CASE WHEN visit_count > 1 THEN 1 END) AS returning_visitors,
    COUNT(*) AS total_visitors,
    (COUNT(CASE WHEN visit_count > 1 THEN 1 END) * 100.0) / COUNT(*) AS returning_visitor_rate
FROM visit_counts;

