#!/bin/bash

echo 'Setting chowns...'
chown -R root:root /root

echo 'Setting chmods...'
chmod -R 2770 /home/*
chmod -R 2770 /root

echo 'All operations finished!'