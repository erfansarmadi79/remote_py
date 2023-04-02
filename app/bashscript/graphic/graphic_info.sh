#!/bin/bash

set -e

# Show help message if user provides -h or --help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo "
Description :
This script displays the status of system graphic.
How to use:
The name of the script"
  exit 0
fi

# Get the VGA controller info using lspci command
VGA=$(lspci | grep VGA)

# Get the vendor and device ID from the VGA controller info
VENDOR=$(echo $VGA | awk '{print $5}')
DEVICE=$(echo $VGA | awk '{print $6}')

# Print out the graphics info and memory
echo "\"graphic\": {"
echo "\"Graphics Vendor\": \"$VENDOR\","
echo "\"Graphics Device\": \"$DEVICE\""
echo "      }"
