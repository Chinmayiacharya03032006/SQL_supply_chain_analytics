📦 SQL Advanced: Supply Chain Analytics Project
End-to-End Supply Chain & Forecasting Analytics Using SQL (MySQL Workbench)

This project showcases advanced SQL capabilities applied in a real-world supply chain analytics scenario. It focuses on data integration, automation, error tracking, forecasting accuracy computation, and database optimization techniques used in enterprise analytics solutions.

🚀 Project Objectives

Consolidate actual vs forecast sales into a single helper fact table

Automate workflow using Triggers & Events

Perform Forecast Accuracy Calculations (MAPE, Net Error, Absolute Error)

Create Stored Procedures, CTEs, Temporary Tables

Implement User Access Control & Privileges

Demonstrate Indexing & Text Search optimization on large datasets

🧠 Key SQL Concepts Implemented
Module	Concepts Covered
Helper Table Creation	UNION, COALESCE, Automated updating
Database Triggers	Auto-insert on new sales/forecast records
Database Events	Scheduled background tasks, log cleanup
CTE & Temp Tables	Forecast accuracy analytical report
Stored Procedures	Dynamic fiscal year accuracy report
Indexing	Full-text index search on film database
User Privilege Control	CREATE USER, GRANTS, EXECUTE permissions
📊 Forecast Accuracy Report

Calculated using:

MAPE / Absolute Percentage Error

Net Error

Market & Customer Accuracy Ranking

Automated result generation via Stored Procedure

Accuracy = 100 - ABS_ERROR_PCT

⚙ Database Automation
Triggers used:

fact_sales_monthly_AFTER_INSERT

fact_forecast_monthly_AFTER_INSERT

Automatically sync new transactional records into fact_act_est table.

Scheduled Event:

e_daily_log_purge deletes log data older than 5 days

🧱 Tech Stack

MySQL Workbench 

SQL Stored Programs (SP, Triggers, Events)

Sakila & Custom Dataset (GDB0041)

🧾 Business Insights From Analytics

✨ Identify high-error forecasting markets
✨ Improve Inventory Planning & Stock allocation
✨ Understand customer-wise performance
✨ Automated reporting reduces manual effort

🌟 Learning Outcomes

✔ SQL automation through triggers & events
✔ Performance optimization using indexes
✔ Building analytical helper tables
✔ Building enterprise-grade stored procedures

🧑‍💻 Author

Chinmayi A
Data Analyst in Progress | SQL & Analytics Enthusiast
📍Banglore, India
📧 email: hello.chinmayiacharya@gmail.com
🌐 LinkedIn: https://www.linkedin.com/in/chinmayi-acharya-b35023342

⭐ Support

If you like this project, consider starring ⭐ the repo and following for more data analytics projects!
