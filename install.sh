#!/bin/sh
sudo mount -o remount,rw /
sudo update-rc.d -f imx-watchdog remove
sudo update-rc.d -f imx-keepalive remove
sudo update-rc.d -f watchdog remove
sudo update-rc.d -f wd_keepalive remove
sudo apt-get update
sudo apt-get install git
git clone https://github.com/gerdmestdagh/imx-watchdog
sudo cd imx-watchdog
sudo cp dat/* /etc
sudo cp ./devregs /usr/bin
sudo cp ./imx-pinger /usr/bin
sudo cp ./imx-watchdog /etc/init.d
sudo cp ./imx-keepalive /etc/init.d
sudo update-rc.d -f imx-watchdog start 1 S .
sudo update-rc.d -f imx-keepalive start 1 2 .
cd ..
rm -rf imx-watchdog
