#!/bin/bash

   # Replace this with the IP address you want to monitor
   IP_TO_MONITOR="YOUR_IP_ADDRESS"

   # Log file path (might differ based on your Linux distribution)
   LOG_FILE="/var/log/auth.log"  # Commonly used in Debian-based systems
   #LOG_FILE="/var/log/secure"   # Commonly used in RHEL-based systems

   # Check if the log file exists
   if [[ ! -f "$LOG_FILE" ]]; then
     echo "Log file does not exist: $LOG_FILE"
     exit 1
   fi

   # Monitor the log file for new entries
   echo "Monitoring SSH commands from IP: $IP_TO_MONITOR"
   tail -f "$LOG_FILE" | grep --line-buffered "sshd.*$IP_TO_MONITOR" | while read -r line; do
     if echo "$line" | grep -q 'COMMAND'; then
       echo "$line"
     fi
   done
