#!bin/bash

# first we ask user for the name
 read -p "Enter your name" name

# Create the folder or directory of files submission_remider_{user's name}

mkdir "submission_reminder_$name"
 
# create PATH
cd "submission_reminder_$name" && mkdir "app" && touch "app/reminder.sh"
cd "submission_reminder_$name" && mkdir "modules" && touch "modules/functions.sh"
cd "submission_reminder_$name" && mkdir "assets" && touch "assets submissions.txt"
cd "submission_reminder_$name" && mkdir "config" && touch "config/config.env"
cd "submission_reminder_$name" && touch "startup.sh"

