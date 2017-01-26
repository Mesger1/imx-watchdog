#!/bin/sh
mount -o remount,rw /
update-rc.d -f imx-watchdog remove
update-rc.d -f imx-keepalive remove
update-rc.d -f watchdog remove
update-rc.d -f wd_keepalive remove
sudo apt-get update
sudo apt-get install git
git clone https://github.com/gerdmestdagh/imx-watchdog
cd imx-watchdog
cp ./devregs /usr/bin
cp ./imx-pinger /usr/bin
cp ./imx-watchdog /etc/init.d
cp ./imx-keepalive /etc/init.d
update-rc.d -f imx-watchdog start 1 S .
update-rc.d -f imx-keepalive start 1 2 .
