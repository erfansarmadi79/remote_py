#!/bin/bash


set -e

# Show help message if user provides -h or --help option
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  echo "
Description :
This script is for displaying the type of IP interface that displays the status in the form of a message.

How to use:
Script name + interface name

tip :
If the interface name does not exist, it displays an appropriate message and returns the exitcode 2."
  exit 0
fi

interface=$1

if [[ ! "$(ip link show ${interface} 2> /dev/null)" ]]; then
  echo "Interface do not: ${interface}"
  exit 2
else

  if [[ $(cat /etc/conf.d/net | grep -c 'config_"$interface"="dhcp"') -eq 1 ]]; then
    echo "The network is configured with dynamic IP address."
  else
    echo "The network is configured with static IP address."
  fi

fi

