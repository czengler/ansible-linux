#!/usr/bin/env bash

# USAGE: ./install_focal_bullseye.sh [new_superuser]

# Installs ansible, creates a new super user, and checks out my ansible files.
# Intended for Ubuntu Focal and Debial Bullseye.

# Install Ansible
echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu focal main" >> /etc/apt/sources.list
apt install -y gnupg2 sudo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
apt update
apt install -y ansible

# Create new super user
adduser "$USER"
usermod -aG sudo "$USER"

# Checkout ansible files for new user
apt install -y git
su - "$USER" -c 'git clone https://github.com/czengler/ansible-linux.git ansible'

# After that, the ansible playbook can be executed with the following command
# ansible-playbook -K local.yml
