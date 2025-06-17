#!/bin/bash

# Ask user for there name
read -p "Enter your name: " name

# Assigning main folder to the user's directory

main_folder="submission_reminder_${name}"

# Script to create directory structure
mkdir -p "$main_folder"/{app,modules,assets,config}

# Script to create reminder.sh
cat << 'EOF' > "$main_folder/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"
EOF

# Script create functions.sh
cat << 'EOF' > "$main_folder/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
local submissions_file=\$1
echo "Checking submissions in \$submissions_file"

# Skip the header and iterate through the lines
while IFS=, read -r student assignment status; do
student=\$(echo "\$student" | xargs)
assignment=\$(echo "\$assignment" | xargs)
status=\$(echo "\$status" | xargs)
if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
fi
done < <(tail -n +2 "\$submissions_file") # Skip the header
}
EOF

# Script to create config.env
cat << EOF > "$main_folder/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Script to create submissions.txt
cat << EOF > "$main_folder/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOF

# Script to create startup.sh
cat << EOF > "$main_folder/startup.sh"
#!/bin/bash

# Get the path to the folder this script is in
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run reminder.sh from inside the app folder
bash "$DIR/app/reminder.sh"
EOF

# Make all the .sh files executable
chmod +x "$main_folder"/app/*.sh
chmod +x "$main_folder"/modules/*.sh
chmod +x "$main_folder"/startup.sh
echo " Environment setup completely in folder: ./$main_folder"

