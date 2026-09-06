# Task 1: Basic Network Scanning with Nmap


## 📌 Overview
This task demonstrates basic network reconnaissance using Nmap. The goal is to identify active hosts, open ports, and running services on a local virtual machine to understand the system's attack surface.

## 🛠️ What is Nmap?
Nmap (Network Mapper) is an open-source tool used for network discovery and security auditing. It works by sending specially crafted packets to the target host and analyzing the responses to determine what ports are open, what services are running, and what operating system is in use.

## 🔎 Why Network Scanning Matters
Network scanning is the foundation of both offensive and defensive cybersecurity. For defenders, it provides visibility into what services are exposed to the network, allowing them to close unnecessary ports and patch vulnerable services (reducing the attack surface). For attackers, it is the primary method used to find potential entry points.

## ⚖️ Ethical Use Guidelines
Network scanning tools like Nmap must **only** be used on networks and devices that you own, or where you have explicit, written permission from the owner. Scanning unauthorized targets can be illegal and is a violation of ethical hacking principles. All scans in this demonstration were performed on a local, isolated Virtual Machine.

## 💻 Installation
*Provide a brief note on your setup here. For example:*
Nmap was utilized on a local Kali Linux VirtualBox VM, where it comes pre-installed. 
*(Alternatively, if on Ubuntu: Installed via `sudo apt update && sudo apt install nmap`)*

## 📄 Results & Findings
* Detailed scan outputs and risk analysis can be found in `nmap_scan_results.txt`.
* Terminal output screenshots are located in the `screenshots/` directory.
