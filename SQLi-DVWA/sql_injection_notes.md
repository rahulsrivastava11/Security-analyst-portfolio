# SQL Injection Attack Log

## Payload 1: The Classic Tautology
* **Input:** `' OR '1'='1`
* **Goal:** Force the backend SQL query's `WHERE` clause to evaluate to TRUE for every single row in the database, overriding the intended search parameter.
* **Result:** Successfully dumped all user records in the `users` table, exposing the First Name and Surname of every registered account.

## Payload 2: The UNION Attack
* **Input:** `1' UNION SELECT user, password FROM users #`
* **Goal:** Use the `UNION` operator to append a completely new, malicious query to the original one, targeting sensitive columns (passwords) that the original query was not designed to display.
* **Result:** Successfully extracted the raw usernames and hashed passwords for all accounts, which could then be taken offline for password cracking.
