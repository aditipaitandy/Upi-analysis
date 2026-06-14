# UPI Transaction Ecosystem: Performance Diagnostics & SQL Analysis

An end-to-end relational database diagnostics and performance evaluation of a UPI transaction ecosystem. Mapped against 150 transaction events with a total processed volume of ₹4,13,198.86, this project isolates severe gateway timeout thresholds, identifies high-growth Tier-2 geographic hubs, and establishes a concrete risk mitigation roadmap for high-value cohorts.

📌 Project Overview

Digital payment networks represent the backbone of the modern digital economy, but system latency and gateway timeouts can lead to massive revenue drop-offs. This project acts as a database-driven performance audit to answer critical system questions:

Where and why are transactions failing?

Which merchant channels suffer the highest friction?

How does consumer spending behave across regional demographics?

Where do high-value systemic concentration risks exist?

🗄️ Relational Database Schema

                  +-----------------------+
                  |       upi_users       |
                  +-----------------------+
                  | user_id (PK)          |
                  | age                   |
                  | gender                |
                  | city                  |
                  | city_tier             |
                  +-----------------------+
                              |
                              |
                  +-----------------------+
                  |   upi_transactions    |
                  +-----------------------+
                  | txn_id (PK)           |
                  | user_id (FK)          |
                  | txn_date              |
                  | txn_time              |
                  | amount                |
                  | merchant_category     |
                  | city                  |
                  | status                |
                  | payment_mode          |
                  | device_type           |
                  +-----------------------+
                              |
                              |
                  +---------------------------+
                  | upi_merchant_categories   |
                  +---------------------------+
                  | merchant_id (PK)          |
                  | category                  |
                  | channel                   |
                  | avg_rating                |
                  +---------------------------+

📊 Performance Diagnostics & Core Queries

1. Systemic Checkout Friction Audit

-- Failure rate percentage
SELECT 
    ROUND(
        SUM(CASE WHEN status = 'Failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS failure_rate_percent
FROM upi_transactions;

Resulting Diagnostic: A staggering 51.33% gateway failure rate (77 out of 150 transactions dropped), indicating extreme systemic checkout friction.

2. Failure Demands by Merchant Category

SELECT 
    merchant_category,
    COUNT(*) AS failed_transactions
FROM upi_transactions
WHERE status = 'Failed'
GROUP BY merchant_category
ORDER BY failed_transactions DESC;

Resulting Diagnostic: Gateway drop-offs heavily cluster inside Entertainment (10), Food (9), and Shopping (9), signaling weak timeout handling during peak traffic windows.

3. Temporal Usage Peaks (24H Window)

SELECT 
    HOUR(STR_TO_DATE(txn_time, '%H:%i')) AS hour,
    COUNT(*) AS transactions
FROM upi_transactions
GROUP BY hour
ORDER BY transactions DESC;

Resulting Diagnostic: Clear bi-modal distribution:
- 14:00 (Lunch peak)
- 21:00–22:00 (Evening surge)

4. High-Value Concentration & Risk Matrix

SELECT 
    user_id,
    SUM(amount) AS total_spent
FROM upi_transactions
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 5;

Resulting Diagnostic: A massive 23.38% of total transaction value (₹96,606.86) is driven by just 5 users.

💰 Top User Concentration

User ID | Total Spend | Network Share
7       | ₹20,298.85  | 4.91%
44      | ₹19,966.97  | 4.83%
25      | ₹19,393.94  | 4.69%
18      | ₹18,671.51  | 4.52%
20      | ₹18,275.59  | 4.42%

🚀 Strategic Business Recommendations

- Automated API Gateway Failovers: Dynamic rerouting during 21:00–23:00 peak load for Food & Entertainment categories.
- Dedicated VIP Server Pipelines: High-priority routing for top 5 users to protect revenue stability.
- Tier-2 Market Expansion Strategy: Focus on high-growth hubs like Indore (22 transactions) and Jaipur (16 transactions).
- Maintenance Window Optimization: Schedule updates between 05:00–08:00 to avoid disruption during peak load.


👩‍💻 Author

Aditi Paitandy  
GitHub: github.com/aditipaitandy  
Role: Data Analyst / Database Administrator

Let’s discuss SQL scaling, database diagnostics, and fintech strategies!
