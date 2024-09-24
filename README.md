Overview
This repository contains two significant SQL-based projects: Insurance Portfolio Analysis and Stock & Work Order Analysis. Both projects demonstrate extensive use of SQL for data management, query execution, and database manipulations.

Projects
1. Insurance Portfolio Analysis
Objective:
The project focuses on analyzing an insurance portfolio using SQL to manage and manipulate relational databases effectively.

Key Features:

Table Creations: 
      Various tables such as loan_sts, remark_criteria, and cibil_score_det are created to manage loan information, customer details, and CIBIL scores.
Triggers: 
      Implemented triggers for automating data validation and entry. For instance, loan_amount_check ensures the loan amount is populated correctly.
Joins: 
      Utilized multiple types of joins (INNER JOIN, LEFT JOIN) to correlate data across different tables, ensuring comprehensive data analysis.
Conditional Statements: 
      CASE statements are used to categorize customers based on income and other criteria.
Stored Procedures: 
      Created stored procedures like loan_details() for reusable SQL code that efficiently retrieves and processes data.

2. Stock & Work Order Analysis
Objective:
This project is centered around managing and analyzing stock and work order data using SQL.

Key Features:

SQL Statements: 
     The project extensively uses SQL statements categorized under DDL, DML, TCL, and DQL.
Advanced Queries: 
     Includes complex SQL queries like IF conditions and SUM functions to calculate pending work orders, stock counts, and other metrics.
Table Creation & Joins: 
     Created tables such as order_pending_status and order_supplier_report by joining multiple tables to consolidate and analyze data.
Stored Procedures: 
     Implemented procedures for recurring SQL tasks, making the code modular and efficient.
