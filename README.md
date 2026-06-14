# UPI Transaction Ecosystem: Performance Diagnostics & SQL Analysis
# UPI Transaction Ecosystem: Performance Diagnostics & SQL Analysis

<p align="left">
  <img src="https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Data%20Analysis-Project-green?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/UPI-FinTech-orange?style=for-the-badge&logo=google-pay&logoColor=white" />
  <img src="https://img.shields.io/badge/Database-Optimization-red?style=for-the-badge&logo=postgresql&logoColor=white" />
</p>

![SQL](https://img.shields.io/badge/SQL-Database-blue?style=for-the-badge&logo=mysql&logoColor=white)

An end-to-end relational database diagnostics and performance evaluation of a UPI transaction ecosystem. Mapped against 150 transaction events with a total processed volume of ₹4,13,198.86, this project identifies system bottlenecks, high-growth Tier-2 hubs, and high-value transaction risks.

---

## 📌 Project Overview

Digital payment systems are highly sensitive to latency, gateway failures, and uneven traffic distribution.  
This project focuses on analyzing real transaction data to uncover performance issues and business insights.

Key areas of analysis include:

- Transaction failure patterns across the system  
- Merchant categories with high operational friction  
- Peak transaction time windows  
- Geographic distribution of user activity  
- High-value user concentration and revenue dependency risk  

---

## 📂 Project Report

👉 [View Full Project PDF](https://github.com/aditipaitandy/Upi-analysis/blob/main/UPI%20Transaction%20Analysis.pdf)

---

## 🗄️ Database Structure

upi_users: Stores user demographic and location details including age, gender, city, and tier classification.

upi_transactions: Contains transaction-level records such as transaction ID, user ID, amount, timestamp, merchant category, status, payment mode, and device type.

upi_merchant_categories: Holds merchant classification data including category type, channel, and rating information.

---

## 💡 Key Insights

- High transaction failure rate indicates gateway instability  
- Food, Entertainment, and Shopping categories face maximum friction  
- Clear peak usage during afternoon and evening hours  
- Revenue is highly concentrated among a small group of users  
- Tier-2 cities show strong growth momentum  

---

## 🚀 Business Recommendations

- Implement automated gateway failover during peak hours  
- Optimize load balancing for high-traffic merchant categories  
- Introduce priority routing for high-value users  
- Focus expansion on emerging Tier-2 cities  
- Schedule maintenance during off-peak hours  

---

## 👩‍💻 Author

Aditi Paitandy  
GitHub: github.com/aditipaitandy  
