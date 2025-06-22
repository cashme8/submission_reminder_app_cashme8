#!/bin/bash

# Get the directory this script is in
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Navigate to the app directory and run the main script
bash "$DIR/app/reminder.sh"
