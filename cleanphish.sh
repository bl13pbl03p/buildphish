#!/bin/bash
echo -e "\033[35m"
echo '
   ________                 ____  __    _      __  
  / ____/ /__  ____ _____  / __ \/ /_  (_)____/ /_ 
 / /   / / _ \/ __ `/ __ \/ /_/ / __ \/ / ___/ __ \
/ /___/ /  __/ /_/ / / / / ____/ / / / (__  ) / / /
\____/_/\___/\__,_/_/ /_/_/   /_/ /_/_/____/_/ /_/                     
Made by bl13pbl03p                            v.0.1

'
echo -e "\033[0m"
echo "[-] Removing service"
sudo systemctl stop gophish
sudo systemctl disable gophish
sudo rm /etc/systemd/system/gophish.service > /dev/null 2>&1
sudo systemctl daemon-reload
echo "[-] Enabling apache2 server"
sudo systemctl unmask apache2 > /dev/null 2>&1
sudo systemctl enable apache2 > /dev/null 2>&1
sudo systemctl restart apache2 > /dev/null 2>&1
echo "[-] Removing Gophish"
sudo rm -rf /opt/gophish
echo "[-] Removing logs"
sudo rm -rf /var/log/gophish
echo "[-] Removing Gophish user"
sudo deluser gophish > /dev/null 2>&1
echo "[+] Configuring apache2 to start on boot"
# commands
echo "[+] Bye bye Gophish"
