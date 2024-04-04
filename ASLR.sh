#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Check if ASLR setting is already defined
grep -q "^kernel.randomize_va_space=" /etc/sysctl.conf

if [ $? -eq 0 ]; then
  sed -i 's/^kernel.randomize_va_space=.*/kernel.randomize_va_space=0/' /etc/sysctl.conf
else
  echo "kernel.randomize_va_space=0" >> /etc/sysctl.conf
fi

sysctl -p

echo "ASLR has been permanently disabled."
