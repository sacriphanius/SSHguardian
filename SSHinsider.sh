#!/bin/bash

# Get the list of logged-in users
logged_in_users=$(who)

# Filter out SSH connections using awk
ssh_connections=$(echo "$logged_in_users" | awk '$2 ~ /pts/ {print $1, $5}')

# Display the result
echo "SSH Connections:"
echo "$ssh_connections"
