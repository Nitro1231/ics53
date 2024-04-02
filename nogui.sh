#!/bin/bash

# Check if root
if [ "$(id -u)" -ne "0" ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# System Updates
sudo apt update
sudo apt upgrade

# Install basic packages
sudo apt-get -y install openssh-server software-properties-common pkg-config cmake python3-pip python3-setuptools python3-wheel ninja-build libffi-dev libgit2-dev
sudo apt-get -y install git tmux libncurses5-dev libncursesw5-dev ncurses-doc libreadline-dev emacs vim nano

# Install core packages
sudo apt-get -y install gdb=12.1-0ubuntu1~22.04.1
sudo apt-get -y install gcc-9=9.5.0-1ubuntu1~22.04
sudo apt-get -y install make=4.3-4.1build1
sudo apt-get -y install valgrind=1:3.18.1-1ubuntu2

# Extra
wget -O zot https://nitro1231.github.io/ics53/zot
sudo chmod -R 777 zot
sudo mv zot /bin

# Add UTM shared folder
mkdir share
sudo chmod -R 777 share

# Replace gcc with gcc-9
sudo mv /usr/bin/gcc-9 /usr/bin/gcc
sed -i '$d' ~/.bashrc

# Fix ~/.bashrc error
sudo echo "fi" | sudo tee -a ~/.bashrc

# Disable memory randomize (ASLR)
# Check if ASLR setting is already defined
sudo grep -q "^kernel.randomize_va_space=" /etc/sysctl.conf

if [ $? -eq 0 ]; then
  # Entry found; replace it
  sudo sed -i 's/^kernel.randomize_va_space=.*/kernel.randomize_va_space=0/' /etc/sysctl.conf
else
  # Entry not found; add it
  echo "kernel.randomize_va_space=0" >> /etc/sysctl.conf
fi

# Apply changes
sudo sysctl -p

echo "ASLR has been permanently disabled."

echo "Installation finished (Last updated Apr 2, 2024)"
