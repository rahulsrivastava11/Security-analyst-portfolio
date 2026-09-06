#!/bin/bash

# Security Analyst Portfolio - Task 2 UFW Configuration Script
# This script configures a basic host-based firewall using UFW.

echo "🔒 Starting UFW Configuration..."

# 1. Reset UFW to default state (clears old rules)
echo "Resetting UFW to default state..."
sudo ufw --force reset

# 2. Set default policies (Deny all incoming, Allow all outgoing)
echo "Setting default policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Apply specific rules from the task checklist
echo "Applying firewall rules..."

# Rule A: Allow SSH (Port 22) for remote administration
sudo ufw allow ssh

# Rule B: Explicitly deny HTTP (Port 80)
sudo ufw deny http

# Rule C: Custom Rule 1 - Allow HTTPS (Port 443) for secure web traffic
sudo ufw allow https

# Rule D: Custom Rule 2 - Block a specific malicious IP address
sudo ufw deny from 192.168.1.100

# 4. Enable UFW (using --force to skip the "are you sure?" prompt in scripts)
echo "Enabling the firewall..."
sudo ufw --force enable

# 5. Display the final configuration for the screenshot
echo "✅ Firewall configuration complete! Here are the active rules:"
sudo ufw status verbose
