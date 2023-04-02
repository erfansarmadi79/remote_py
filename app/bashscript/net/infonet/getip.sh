#!/bin/sh

set -e


# Show help message if user provides -h or --help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo "
Description :
This script displays the IP interfaces of the system.
How to use:
Script name + interface name

tip :
If the interface name is wrong, it displays an appropriate message and returns the exitcode 2."
  exit 0
fi

interface_name=$1


if [[ ! "$(ip link show ${interface} 2> /dev/null)" ]]; then
  echo "Interface do not: ${interface}"
  exit 2
else
  ip addr show $interface_name | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
fi

#if /sbin/ethtool "$interface_name" | grep -q "Link detected: yes"; then
#  ip addr show $interface_name | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1
#else
#  exit 2
#fi


