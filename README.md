# UPI Transaction Ecosystem: Performance Diagnostics & SQL Analysis

An end-to-end relational database diagnostics and performance evaluation of a UPI transaction ecosystem. Mapped against 150 transaction events with a total processed volume of ₹4,13,198.86, this project isolates severe gateway timeout thresholds, identifies high-growth Tier-2 geographic hubs, and establishes a concrete risk mitigation roadmap for high-value cohorts.

## Project Overview

Digital payment systems face latency, gateway failures, and uneven load distribution. This project analyzes:

- Transaction failure patterns  
- Merchant category friction  
- Regional spending behavior  
- High-value user concentration risk  

## Database Schema

upi_users:
user_id (PK), age, gender, city, city_tier

upi_transactions:
txn_id (PK), user_id (FK), txn_date, txn_time, amount, merchant_category, city, status, payment_mode, device_type

upi_merchant_categories:
merchant_id (PK), category, channel, avg_rating

## SQL Analysis

### 1. Failure Rate

SELECT 
    ROUND(
        SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS failure_rate_percent
FROM upi_transactions;

Insight: 51.33% transactions failed (77 out of 150), showing high system instability.

---

### 2. Failures by Merchant Category

SELECT 
    merchant_category,
    COUNT(*) AS failed_transactions
FROM upi_transactions
WHERE status = 'Failed'
GROUP BY merchant_category
ORDER BY failed_transactions DESC;

Insight: Entertainment, Food, and Shopping have highest failures.

---

### 3. Peak Transaction Hours

SELECT 
    HOUR(STR_TO_DATE(txn_time, '%H:%i')) AS hour,
    COUNT(*) AS transactions
FROM upi_transactions
GROUP BY hour
ORDER BY transactions DESC;

Insight: Peak hours are 14:00 and 21:00–22:00.

---

### 4. Top High-Value Users

SELECT 
    user_id,
    SUM(amount) AS total_spent
FROM upi_transactions
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 5;

Insight: Top 5 users contribute 23.38% of total transaction value (₹96,606.86).

## Key Insights

- High gateway failure rate indicates system instability  
- Food and Entertainment categories are most affected  
- Clear peak load during afternoon and evening hours  
- Revenue highly concentrated among few users  

## Recommendations

- Implement gateway failover system during peak hours  
- Optimize routing for high-traffic merchant categories  
- Protect high-value user transactions with priority pipelines  
- Focus expansion on Tier-2 cities like Indore and Jaipur  
- Schedule maintenance during off-peak hours (05:00–08:00)  



## Author

Aditi Paitandy  
GitHub: github.com/aditipaitandy  
Data Analyst
