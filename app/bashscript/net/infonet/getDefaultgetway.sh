#!/bin/sh

set -e


# Show help message if user provides -h or --help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo "
Description :
This script displays the Defaultgatway interfaces of the system.
How to use:
Script name + interface name

tip :
If the interface name is wrong, it displays an appropriate message and returns the exitcode 2."
  exit 0
fi



interface=$1

if [[ ! "$(ip link show ${interface} 2> /dev/null)" ]]; then
  echo "Interface do not: ${interface}"
  exit 2
else
  ip route | awk "/dev/{if(\$5==\"$interface\") print \$3}"
fi

#if /sbin/ethtool "$interface" | grep -q "Link detected: yes"; then
#  ip route | awk "/dev/{if(\$5==\"$interface\") print \$3}"
#else
#  exit 2
#fi