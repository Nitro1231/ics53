#!/bin/bash

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

# Install VS Code
sudo apt install curl
curl -o vscode.deb -O -J -L https://code.visualstudio.com/sha/download\?build\=stable\&os\=linux-deb-arm64
sudo apt install ./vscode.deb

# Add UTM shared folder
mkdir share
sudo chmod -R 777 share
sudo echo "share /home/$USER/share virtiofs rw,nofail 0 0" | sudo tee -a /etc/fstab

# Replace gcc with gcc-9
sudo mv /usr/bin/gcc-9 /usr/bin/gcc
sed -i '$d' ~/.bashrc

# Disable memory randomize
sudo sh -c 'echo 0 > /proc/sys/kernel/randomize_va_space'

# Fix ~/.bashrc error
sudo echo "fi" | sudo tee -a ~/.bashrc

echo "Installation finished (Last updated Mar 30, 2024)"
