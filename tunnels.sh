#!/bin/bash

# Remote mysql via ssh tunnel
screen -AmdS PUT_SCREEN_NAME ssh -N -L 3307:127.0.0.1:3306 USER@DOMAIN -p 22 -i /root/.ssh/SOME_KEY_PATH