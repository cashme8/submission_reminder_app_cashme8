#!/bin/bash

# Prompt for new assignment name
read -p "Enter the new assignment name: " new_assignment

# Find the environment directory (e.g., submission_reminder_gislain)
env_dir=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n 1)

# Stop if environment folder not found
if [[ -z "$env_dir" ]]; then
  echo " Environment directory not found. Please run create_environment.sh first."
    exit 1
    fi

    # Update ASSIGNMENT in config.env
    sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$env_dir/config/config.env"

    # Rerun the startup script
    bash "$env_dir/startup.sh"
