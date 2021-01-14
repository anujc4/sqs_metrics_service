#!/usr/bin/env bash

# Command to create scaling policy
# Needs to be executed only once

aws autoscaling put-scaling-policy \
  --policy-name sqs-target-tracking-scaling-policy \
  --auto-scaling-group-name wordfreq-dev-asg \
  --policy-type TargetTrackingScaling \
  --target-tracking-configuration file://config.json
