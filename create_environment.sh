#!bin/bash

# first we ask user for the name
 read -p "Enter your name:  " name

# Create the folder or directory of files submission_remider_{user's name}

folder="submission_reminder_$name"

mkdir -p "$folder"

# create the startup.sh file

touch "$folder/startup.sh"
echo -e "#!/bin/bash/n1 ./scripts/reminder.sh"

# Directory = file mapping

declare -A file_map=(
	["app"]="reminder.sh"
	["modules"]="functions.sh"
	["assets"]="submissions.txt"
	["config"]="config.env"
)
declare -A files_content=(
["reminder.sh"]="#!/bin/bash
source ./scripts/functions.sh
source ./config/config.env

echo "Reminder: These students have not submitted the assignment: \$ASSIGNMENT"
grep -v "submitted" submissions.txt | cut -d',' -f1")


# create each directory and its unique file with a loop

for dir in "${!file_map[@]}"; do
	path="$folder/$dir"
	mkdir -p "$path"
	touch "$path/${file_map[$dir]}"

	mkdir -p "$dir_path"
	echo -e "${}"
done

# found a way to jump to the next line
