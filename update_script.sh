#!/bin/bash

apt -y update
apt -y upgrade
# reboot
if [ -f /var/run/reboot-required ];then
  reboot
fi

