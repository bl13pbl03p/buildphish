#!/bin/bash
echo -e "\033[35m"
echo '
   ________                 ____  __    _      __  
  / ____/ /__  ____ _____  / __ \/ /_  (_)____/ /_ 
 / /   / / _ \/ __ `/ __ \/ /_/ / __ \/ / ___/ __ \
/ /___/ /  __/ /_/ / / / / ____/ / / / (__  ) / / /
\____/_/\___/\__,_/_/ /_/_/   /_/ /_/_/____/_/ /_/                     
Made by bl13pbl03p                            v.1.0

'
echo -e "\033[0m"
echo "[-] Removing service"
sudo systemctl stop gophish
sudo systemctl disable gophish
sudo rm /etc/systemd/system/gophish.service > /dev/null 2>&1
sudo systemctl daemon-reload
# Check if apache2 service is running
echo "[*] Checking if apache2 server needs to be renabled"
if systemctl is-active --quiet apache2; then
    sudo systemctl unmask apache2 > /dev/null 2>&1
    sudo systemctl enable apache2 > /dev/null 2>&1
    sudo systemctl restart apache2 > /dev/null 2>&1
    echo "[+] Restored apache2 to start on boot"
else
    echo "[-] Apache2 server was not detected"
fi
echo "[-] Removing Gophish"
sudo rm -rf /opt/gophish
echo "[-] Removing logs"
sudo rm -rf /var/log/gophish
echo "[-] Removing Gophish user"
sudo deluser gophish > /dev/null 2>&1
# commands
echo "[+] Bye bye Gophish"
