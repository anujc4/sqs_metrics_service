#!/usr/bin/env bash

sudo useradd metricsservice -s /sbin/nologin -M >/dev/null 2>&1

# Copy metrics service systemd files to location
sudo cp custom_metrics.service /lib/systemd/system/
sudo cp custom_metrics.timer /lib/systemd/system/
sudo cp custom_metrics.target /lib/systemd/system/

# Add required permissions
sudo chmod 755 /lib/systemd/system/custom_metrics.service
sudo chmod 755 /lib/systemd/system/custom_metrics.timer
sudo chmod 755 /lib/systemd/system/custom_metrics.target

# Enable service
sudo systemctl enable custom_metrics.timer
sudo systemctl enable custom_metrics.service

# Start metrics service
sudo systemctl start custom_metrics.timer
sudo systemctl start custom_metrics.service