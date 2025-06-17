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
source ./modules/functions.sh
source ./config/config.env

echo "Checking who hasn't submitted $ASSIGNMENT..."
grep -v "submitted" ./assets/submissions.txt | cut -d',' -f1
EOF

# Script create functions.sh
cat << 'EOF' > "$main_folder/modules/functions.sh"
#!/bin/bash
# Add any custom functions here
get_pending_students() {
grep -v "submitted" ./assets/submissions.txt | cut -d',' -f1
}
EOF

# Script to create config.env
cat << EOF > "$main_folder/config/config.env"
ASSIGNMENT=Assignment_1
EOF

# Script to create submissions.txt
cat << EOF > "$main_folder/assets/submissions.txt"
Alice,submitted
Bob,pending
Charlie,pending
Diana,submitted
Eve,pending
Frank,submitted
Grace,pending
Henry,submitted
Ivan,pending
Jack,submitted
EOF

# Script to create startup.sh
cat << 'EOF' > "$main_folder/startup.sh"
#!/bin/bash
./app/reminder.sh
EOF

# Make all the .sh files executable
chmod +x "$main_folder"/app/*.sh
chmod +x "$main_folder"/modules/*.sh
chmod +x "$main_folder"/startup.sh
echo " Environment setup completely in folder: $main_folder"
