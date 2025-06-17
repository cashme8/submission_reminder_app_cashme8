#!/bin/bash

read -p "Enter new assignment name: " new_assignment

# Find the folder
folder=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n1)

# Update config
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$folder/config/config.env"

# Run the app
bash "$folder/startup.sh"

