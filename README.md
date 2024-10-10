# Daily Disk Usage Report Script for MyComp

This project contains a Bash script that automates the process of generating daily disk usage reports for all mounted filesystems on a Linux server and sends the report via email to the system administrator. This ensures that disk usage does not exceed critical levels and allows tracking of storage consumption trends over time.

## Features

- **Disk Usage Report**: Collects information about total size, used space, available space, and usage percentage for all mounted filesystems.
- **Email Notification**: Sends the disk usage report to the system administrator (`admin@mycomp.com`) daily.
- **Automation**: The process is automated through a cron job that runs the script every day.

## Files

- `disk_usage_report.sh`: The main script that generates the disk usage report and emails it to the administrator.

## Prerequisites

Before running the script, ensure the following packages are installed:

1. **mailutils**: Required to send emails from the script.
   ```bash
   sudo apt-get install mailutils  # For Debian-based systems
   sudo yum install mailx          # For Red Hat-based systems
   sudo dnf install procmail       # For Red Hat-based System
df: The script uses the df command to collect disk usage information (pre-installed on most Linux systems).
How to Use
Clone this repository to your server:

bash:
git clone https://github.com/Athul-T-S/disk-usage-report.git
cd disk-usage-report
Make the script executable:

bash:
chmod +x disk.sh
Update the destination email in the script if necessary:

bash:
ADMIN_EMAIL="admin@mycomp.com"  # Modify this to your email address if needed
Run the script manually to verify functionality:

bash:
./disk_usage_report.sh
Set up the script to run daily using a cron job:

Open the crontab editor:
bash:
crontab -e
Add the following line to schedule the script to run every day at midnight:
bash:
0 0 * * * /path/to/disk.sh

Verify the cron job is installed correctly:
crontab -l
