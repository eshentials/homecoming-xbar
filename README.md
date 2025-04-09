# homecoming-xbar
Displays a countdown to your homecoming date right in the macOS menu bar. Click to update the date with a simple popu
Homecoming Countdown for Xbar
This plugin shows how many days are left until you return home. You can set or change the date through a popup dialog — no need to open a terminal or edit the script manually.

Requirements
macOS with Xbar

bash (default on macOS)

osascript (included on macOS)

How to Install
Download or copy this script to your Xbar plugins folder.

Default path: ~/Library/Application Support/xbar/plugins

Make sure the file ends with .sh and is executable:

bash
Copy
Edit
chmod +x homecoming.1d.sh
The 1d tells Xbar to refresh once every day (you can change it to 5m for every 5 minutes).

Launch Xbar (or refresh it if it’s already running). You’ll see something like:

Copy
Edit
35 days
Click on the countdown to open the dropdown.
Select “Change Home Date” and a pop-up will ask for your target date in YYYY-MM-DD format.

The date is saved in a hidden file: ~/.home_target_date.
This means your setting will persist across restarts.
