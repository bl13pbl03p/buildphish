#!/bin/bash

FILE=/etc/systemd/system/gophish.service
# Set the expected checksum of the ZIP file
expected_checksum="44f598c1eeb72c3b08fa73d57049022d96cea2872283b87a73d21af78a2c6d47"
password="$(grep --color=always --word-regexp 'Please login with the username admin and the password' /var/log/gophish/gophish.log | cut -d' ' -f12- | tr -d '"')"

if [ -f "$FILE" ]; 
then
echo -e "\033[35m"
echo ' 
    ____        _ __    ______  __    _      __  
   / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
  / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
 / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
/_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
Made by bl13pbl03p                          v.0.1
'
echo -e "\033[0m"
echo -e "\033[31m[-] Gophish is already configured as a service\033[0m"
echo -e "\033[31m[-] Terminating BuildPhish\033[0m"
else 
echo -e "\033[35m"
echo ' 
    ____        _ __    ______  __    _      __  
   / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
  / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
 / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
/_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
Made by bl13pbl03p                          v.0.1
'
echo -e "\033[0m"

# Installing Gophish
echo -e "\033[32m[+] Let's build!\033[0m"
echo -e "\033[32m[+] Updating apt and installing packages\033[0m"
sudo apt update -y > /dev/null 2>&1
sudo apt install pv wget unzip -y > /dev/null 2>&1
sudo service apache2 stop && sudo systemctl disable apache2 && sudo systemctl mask apache2 > /dev/null 2>&1 
echo -e "\033[32mPrevented apache2 from starting on boot\033[0m"
echo -e "\033[32m[+] Downloading Gophish v0.12.1\033[0m"

# Download the ZIP file
wget -q --show-progress https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip

# Get the actual checksum of the ZIP file
actual_checksum=$(sha256sum gophish-v0.12.1-linux-64bit.zip | cut -d' ' -f1)

# Compare the expected checksum to the actual checksum
if [ "$expected_checksum" = "$actual_checksum" ]; then
  echo -e "\033[32m[+]Checksum verified: file is valid\033[0m"
else
  echo -e "\033[31m[-]Checksum mismatch: file may be corrupt or tampered with\033[0m"
fi

# Start the progress bar
echo -e "\033[32m[+] Unzipping..\033[0m"

# Unzip the file and show the progress bar using pv
sudo unzip -o gophish-v0.12.1-linux-64bit.zip -d /opt/gophish | pv -l >/dev/null

echo "Unzip complete!"
sudo chmod +x /opt/gophish/gophish
echo -e "\033[32m[+] Installed gophish\033[0m"

# Setting up as service
echo -e "\033[32m[+] Setting up Gophish as a service\033[0m"
sudo useradd -r gophish
sudo cp -r gophish.service /etc/systemd/system/
sudo mkdir /var/log/gophish
sudo chown -R gophish:gophish /opt/gophish/ /var/log/gophish/
sudo setcap cap_net_bind_service=+ep /opt/gophish/gophish
sudo systemctl daemon-reload
sudo systemctl start gophish
sudo systemctl enable gophish
echo -e "\033[32m[+] Gophish is setup as service\033[0m"
echo -e "\033[33m[?] Check if service is running: sudo systemctl status gophish\033[0m"
echo -e "\033[33m[?] If service does not run, troubleshoot the /etc/systemd/system/gophish.service file\033[0m"
echo "[*] Username is admin, password is shown below"
cat $password
echo "[*] Visit https://localhost:3333 to login"
fi
