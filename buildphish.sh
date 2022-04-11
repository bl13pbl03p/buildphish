#!/bin/bash

FILE=/etc/systemd/system/gophish.service
if [ -f "$FILE" ]; 
then
echo ' 
    ____        _ __    ______  __    _      __  
   / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
  / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
 / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
/_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
Made by bl13pbl03p                          v.0.1
'

echo "[-] Gophish is already configured as a service"
echo "[-] Terminating BuildPhish"
else 
echo ' 
    ____        _ __    ______  __    _      __  
   / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
  / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
 / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
/_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
Made by bl13pbl03p                          v.0.1
'

# Installing Gophish
echo "[+] Let's build!"                                                 
sudo service apache2 stop
echo "[+] Stoppped apache2"
echo "[+] Downloading Gophish v0.11"
wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip > /dev/null 2>&1
echo "[+] Unzipping.."
sudo unzip gophish-v0.11.0-linux-64bit.zip -d /opt/gophish > /dev/null 2>&1
sudo chmod +x /opt/gophish/gophish
echo "[+] Installed gophish"

# Setting up as service
sudo useradd -r gophish
sudo cp gophish.service /etc/systemd/system/
sudo mkdir /var/log/gophish
sudo chown -R gophish:gophish /opt/gophish/ /var/log/gophish/
sudo setcap cap_net_bind_service=+ep /opt/gophish/gophish
sudo systemctl daemon-reload
sudo systemctl start gophish
sudo systemctl enable gophish

echo "[+] Gophish is setup as service"
echo "[?] Check if service is running: sudo systemctl status gophish"
echo "[?] If service does not run, troubleshoot the /etc/systemd/system/gophish.service file"
echo "[*] Username is admin, view initial password with:"
echo "cat /var/log/gophish/gophish.log | grep 'Please login with the username admin and the password'"
echo "[*] Visit https://localhost:3333 to login"
fi
