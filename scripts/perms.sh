#!/bin/bash

USERS=( "user1" "user2" )

# Set basic home permissions
chown root:root /home
chmod 755 /home
#chmod -R 2770 /home/*

# Set user home directories
for USER in "${USERS[@]}"
do
    chmod -R 755 /home/$USER
    chmod -R 700 /home/$USER/.ssh
    chmod -R 600 /home/$USER/.ssh/authorized_keys
    chown -R $USER:$USER /home/$USER
done

# Set root permissions
chown -R root:root /root
chmod -R 755 /root
chmod -R 700 /root/.ssh
chmod -R 600 /root/.ssh/authorized_keys

echo 'All permissions set!'
