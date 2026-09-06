# Task 2: Basic Firewall Configuration with UFW


## 📌 Overview
This task demonstrates how to secure a Linux system by configuring a host-based firewall using UFW (Uncomplicated Firewall). 

## 🧱 What is a Firewall?
A firewall acts as a digital bouncer between a computer and a network. It inspects incoming and outgoing traffic and decides whether to allow or block it based on a predefined set of security rules. 

## 📜 Configured Rules & Justifications
*   **Allow SSH (Port 22):** Allows secure remote administration of the server. 
*   **Deny HTTP (Port 80):** Explicitly blocks unencrypted web traffic to force secure connections.
*   **Allow HTTPS (Port 443):** [Custom Rule 1] Allows encrypted web traffic so users can securely access hosted web applications.
*   **Deny IP Range 192.168.1.100:** [Custom Rule 2] Blocks a specific IP address simulating a known malicious actor.

## 🧪 Testing Methodology
To verify the rules were working, I started a temporary Python web server on port 80. I then attempted to access it locally using `curl`. The firewall successfully dropped the connection, verifying that the `deny http` rule was active.

## 📄 Scripts & Proof
* The automated bash script used to apply these rules is included as `ufw_configuration.sh`.
* A screenshot of the active rules (`sudo ufw status verbose`) is located in the `screenshots/` directory.
