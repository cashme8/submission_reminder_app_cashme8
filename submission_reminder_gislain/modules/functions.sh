#!/bin/bash
# Add any custom functions here
get_pending_students() {
grep -v "submitted" ./assets/submissions.txt | cut -d',' -f1
}
