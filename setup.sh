#!/usr/bin/env bash

sudo useradd metricsservice -s /sbin/nologin -M >/dev/null 2>&1

sudo rm /lib/systemd/system/service.service
sudo rm /lib/systemd/system/timer.timer

# Stop service
sudo systemctl stop custom_metrics.timer
sudo systemctl stop custom_metrics.service

# Disable service
sudo systemctl disable custom_metrics.timer
sudo systemctl disable custom_metrics.service

# Copy metrics service systemd files to location
sudo cp custom_metrics.service /lib/systemd/system/
sudo cp custom_metrics.timer /lib/systemd/system/

# Add required permissions
sudo chmod u+x /lib/systemd/system/custom_metrics.service
sudo chmod u+x /lib/systemd/system/custom_metrics.timer

# Enable service
sudo systemctl enable custom_metrics.timer
sudo systemctl enable custom_metrics.service

# Start metrics service
sudo systemctl start custom_metrics.timer
sudo systemctl start custom_metrics.service

# Test commands
sudo systemctl status custom_metrics.service
sudo systemctl status custom_metrics.timer
sudo journalctl -u custom_metrics.service
sudo journalctl -u custom_metrics.timer
sudo systemctl list-timers