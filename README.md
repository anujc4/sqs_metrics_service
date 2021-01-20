# Scaling based on Amazon SQS

This is a python based implementation of the service introduced in the AWS guide to setup Auto Scaling group in response to changes in system load in an Amazon Simple Queue Service (Amazon SQS) queue.

## Structure

The structure of this service is as follows:

- `push.py`: Python script which calculates `backlog per instance` metric for given a SQS queue and Auto Scaling Group's name.

- `customer_metrics.service`: Systemd configuration to set register push.py as a system service.

- `customer_metrics.timer`: Systemd timer to execute the script every minute.

- `scaling_policy.sh` and `config.json`: Commands to create/modify the Target Tracking scaling policy.

- `setup.sh`: Bash commands to create the systemd service.

## Usage Guide

You can either use the script in `push.py` as an AWS Lambda function and create timer there to execute the script at a minute frequency or create a small EC2 instance, setup the service there and use that to push the metrics to CloudWatch.