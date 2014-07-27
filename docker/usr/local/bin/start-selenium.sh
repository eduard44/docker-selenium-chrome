#!/bin/bash

export DISPLAY=:99
/bin/sh /etc/init.d/xvfb start
echo "Starting Google Chrome ..."
webdriver-manager start &