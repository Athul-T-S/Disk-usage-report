#!/bin/bash

# Destination email address
ADMIN_EMAIL="admin@mycomp.com"

# Temporary file for the disk usage report
REPORT_FILE="/tmp/disk_usage_report.txt"
FORMATTED_REPORT="/tmp/formatted_report.txt"

# Function to generate disk usage report
generate_report() {
    # Getting disk usage information
    df -h > "$REPORT_FILE"
    
    # Extracting relevant fields for report
    awk 'NR>1 {print "Filesystem: " $1, "\nTotal Size: " $2, "\nUsed Space: " $3, "\nAvailable Space: " $4, "\nUsage Percentage: " $5 "\n"}' "$REPORT_FILE" > "$FORMATTED_REPORT"
    
    # Constructing email content
    SUBJECT="Daily Disk Usage Report"
    BODY="Please find attached the daily disk usage report.\n\n$(cat $FORMATTED_REPORT)"
    
    # Sending email with mail command
    echo -e "$BODY" | mail -s "$SUBJECT" "$ADMIN_EMAIL"
    
    # Clean up temporary files
    rm "$REPORT_FILE" "$FORMATTED_REPORT"
}

# Call the function to generate and email the report
generate_report

