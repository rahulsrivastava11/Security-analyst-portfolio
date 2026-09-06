# Task 3: SQL Injection on DVWA


## 📌 Overview
This task demonstrates a classic SQL Injection (SQLi) vulnerability using the Damn Vulnerable Web Application (DVWA) on the "Low" security setting. The objective is to understand how untrusted user input can manipulate backend database queries.

## 🛠️ Environment Setup
DVWA was hosted locally using [Specify XAMPP on Windows OR LAMP on WSL] to provide a safe, isolated testing environment. 

## 💉 What is SQL Injection?
SQL Injection is a web security vulnerability that allows an attacker to interfere with the queries that an application makes to its database. It occurs when user input is improperly sanitized and directly concatenated into a SQL statement, allowing the attacker to change the logic of the query.

## 🔎 Payload Analysis & Data Exposed
By entering a tautology payload like `' OR '1'='1`, the backend SQL query's `WHERE` clause is forced to evaluate to `TRUE` for every row in the database. 
* **Data Exposed:** This vulnerability allowed me to dump the entire user database table, revealing all registered First Names and Surnames.
* Detailed payload logs can be found in `sql_injection_notes.md`.

## 🛡️ Mitigation: How to Fix This
To prevent SQL injection, developers must stop treating user input as executable code. The industry standard fix is using **Parameterized Queries (Prepared Statements)**. Instead of concatenating strings, parameterized queries force the database to treat the input strictly as data (a literal value) rather than executable SQL syntax.
