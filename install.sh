#!/bin/bash

# Eable SSH password authentication
echo "Enable SSH password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/.PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
/etc/init.d/sshd restart

# Set Root password
echo "Set root password"
echo "Username: $1"
echo "Password: $2"
echo -e "$2\n$2" | passwd $1 >/dev/null 2>&1

# Install Python3 for Ansible Usage
echo "Starting install Python3"
if which python3; then
  echo "Python already installed lets move on.";
else
  sudo apk --update --no-cache add python3
fi