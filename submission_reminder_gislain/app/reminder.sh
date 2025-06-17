#!/bin/bash
source ./modules/functions.sh
source ./config/config.env

echo "Checking who hasn't submitted $ASSIGNMENT..."
grep -v "submitted" ./assets/submissions.txt | cut -d',' -f1
