#!/bin/bash
echo '
   ________                 ____  __    _      __  
  / ____/ /__  ____ _____  / __ \/ /_  (_)____/ /_ 
 / /   / / _ \/ __ `/ __ \/ /_/ / __ \/ / ___/ __ \
/ /___/ /  __/ /_/ / / / / ____/ / / / (__  ) / / /
\____/_/\___/\__,_/_/ /_/_/   /_/ /_/_/____/_/ /_/                     
Made by bl13pbl03p                            v.0.1'
echo "[-] Removing service"
sudo systemctl stop gophish
sudo systemctl disable gophish
sudo rm /etc/systemd/system/gophish.service
sudo systemctl daemon-reload
echo "[-] Removing Gophish"
sudo rm -rf /opt/gophish
echo "[-] Removing logs"
sudo rm -rf /var/log/gophish
echo "[-] Removing Gophish user"
sudo deluser gophish > /dev/null 2>&1
echo "[+] Bye bye Gophish"
