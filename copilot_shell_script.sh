#!/bin/bash
#
## Prompt for new assignment name
#read -p "Enter the new assignment name: " new_assignment
#
## Locate the main folder dynamically
#folder=$(find . -type d -name "submission_reminder_*" | head -n1)

# Update assignment in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=${new_assignment}/" "$folder/config/config.env"

# Run the startup script
bash "$folder/startup.sh"

