✅ Problem Summary
For each month and country, calculate:
Total number of transactions
Number of approved transactions
Total transaction amount
Total approved transaction amount
...........................................................................................................................
  
✅ Final Optimized PostgreSQL
-- Monthly Transactions I
-- PostgreSQL Solution

SELECT
    TO_CHAR(DATE_TRUNC('month', trans_date), 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(*) FILTER (WHERE state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(
        SUM(amount) FILTER (WHERE state = 'approved'),
        0
    ) AS approved_total_amount
FROM transactions
GROUP BY
    DATE_TRUNC('month', trans_date),
    country;
