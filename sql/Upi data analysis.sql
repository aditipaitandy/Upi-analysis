-- Create and select the database
CREATE DATABASE IF NOT EXISTS upi_analysis;
USE upi_analysis;

-- Analysis 1: Total transactions and total volume
SELECT 
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_volume
FROM upi_transactions;


-- Analysis 2: Success vs failed transactions
SELECT 
    status,
    COUNT(*) AS transaction_count
FROM upi_transactions
GROUP BY status;



-- Analysis 3: Failure rate percentage
SELECT 
    ROUND(
        SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS failure_rate_percent
FROM upi_transactions;


-- Analysis 4: Peak transaction hours
SELECT 
    HOUR(STR_TO_DATE(txn_time, '%H:%i')) AS hour,
    COUNT(*) AS transactions
FROM upi_transactions
GROUP BY hour
ORDER BY transactions DESC;

-- Analysis 5: Weekday vs weekend transaction volume
SELECT 
    CASE 
        WHEN DAYOFWEEK(txn_date) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS transactions
FROM upi_transactions
GROUP BY day_type;

-- Analysis 6: Top spending categories
SELECT 
    merchant_category,
    SUM(amount) AS total_spent
FROM upi_transactions
GROUP BY merchant_category
ORDER BY total_spent DESC;


-- Analysis 7: Most frequent categories
SELECT 
    merchant_category,
    COUNT(*) AS frequency
FROM upi_transactions
GROUP BY merchant_category
ORDER BY frequency DESC;



-- Analysis 8: City-wise transaction volume
SELECT 
    city,
    COUNT(*) AS total_transactions
FROM upi_transactions
GROUP BY city
ORDER BY total_transactions DESC;


-- Analysis 9: Spending by city tier
SELECT 
    u.city_tier,
    SUM(t.amount) AS total_spent
FROM upi_transactions t
JOIN upi_users u ON t.user_id = u.user_id
GROUP BY u.city_tier;


-- Analysis 10: Top 5 high value users
SELECT 
    user_id,
    SUM(amount) AS total_spent
FROM upi_transactions
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 5;


-- Analysis 11: Failed transactions by category
SELECT 
    merchant_category,
    COUNT(*) AS failed_transactions
FROM upi_transactions
WHERE status = 'Failed'
GROUP BY merchant_category;