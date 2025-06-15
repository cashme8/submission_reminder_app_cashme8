# Submission Reminder App

This is a simple shell-based submission reminder system. It helps track which students have not submitted a specific assignment and sends reminders based on a list of student names and submission status.

## 🔧 Setup Instructions

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/cashme8/submission_reminder_app_cashme8.git
   cd submission_reminder_app_cashme8
### Make the setup script executable:
chmod +x create_environment.sh

### Run the setup script to create the project folder and files:
./create_environment.sh

### Navigate into the generated folder (e.g., submission_reminder_cashme8) and run the app:
cd submission_reminder_cashme8
./startup.sh

### Update Assignment Name
To change the assignment and rerun the reminder:
./copilot_shell_script.sh

## Project Structure
submission_reminder_YourName/
├── config/
│   └── config.env
├── scripts/
│   ├── reminder.sh
│   ├── functions.sh
│   └── startup.sh
├── submissions.txt

## Features
Reads student names from a text file

Sends reminders to students who haven’t submitted

Easily updates assignment name

Organized folder structure

Fully executable from terminal

# Author
Created by KABANDA Gislain
