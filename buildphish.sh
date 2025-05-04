#!/bin/bash

FILE=/etc/systemd/system/gophish.service
# Set the expected checksum of the ZIP file
# expected_checksum="44f598c1eeb72c3b08fa73d57049022d96cea2872283b87a73d21af78a2c6d47" for original gophish repo
expected_checksum="bf9c7fc9c82d7ab0d6daf5f64bbea9943c074471eeb12b154e8c1e788a92d042" # for Kubagretzky gophish repo

if [ -f "$FILE" ]; 
    then
        echo -e "\033[35m"
        echo ' 
            ____        _ __    ______  __    _      __  
           / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
          / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
         / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
        /_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
        Made by bl13pbl03p                          v.1.0
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
    Made by bl13pbl03p                          v.1.0
    '
    echo -e "\033[0m"

    # Installing Gophish
    echo -e "\033[32m[+] Let's build!\033[0m"
    echo -e "\033[32m[+] Updating apt and installing packages\033[0m"
    sudo apt update -y > /dev/null 2>&1
    sudo apt install pv wget unzip -y > /dev/null 2>&1

    # Check if apache is running
    if systemctl is-active --quiet apache2; then
        echo "[*] Apache server detected, stopping and disabling..."
        sudo service apache2 stop && sudo systemctl disable apache2 && sudo systemctl mask apache2 > /dev/null 2>&1
        echo -e "\033[32m[+]Apache service stopped, disabled, and masked.\033[0m"
    else
        echo "[*] No Apache server detected."
    fi
    echo -e "\033[32mPrevented apache2 from starting on boot\033[0m"
    echo -e "\033[32m[+] Downloading Gophish \e[1m(Evilginx compatible version)\e[0m v0.12.1\033[0m"

    # Download the ZIP file
    # wget -q --show-progress https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip
    wget -q --show-progress https://github.com/kgretzky/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip

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

    echo -e "\033[32m[+] Unzip complete!\033[0m"
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
    
    # Check log files to print credentials
    LOG_FILE="/var/log/gophish/gophish.log"
    SEARCH_STRING="Please login with the username admin and the password"
    MAX_WAIT_TIME=20  # Maximum time to wait in seconds
    INTERVAL=1  # How often to check (in seconds)

    echo "[*] Checking for password in the log file for up to $MAX_WAIT_TIME seconds..."

    START_TIME=$(date +%s)

    while true; do
        password=$(grep --word-regexp "$SEARCH_STRING" "$LOG_FILE" | cut -d' ' -f12- | tr -d '"')

        if [[ -n "$password" ]]; then
            echo -e "\033[32m[+] Username is admin, password is $password \033[0m"
            break
        fi

        CURRENT_TIME=$(date +%s)
        ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

        if [[ $ELAPSED_TIME -ge $MAX_WAIT_TIME ]]; then
            echo -e "\e[31m[!] Timeout reached, no password found.\e[0m"
            echo -e "\033[33m[?] Retrieve password with command in README under \e[1m'Known issues'\e[0m"
            break
        fi

        sleep $INTERVAL
    done

    # Function to log in, change initial password via bash prompt and echo fresh API key via GET to https://localhost:3333/api/reset 
    
    echo "[*] Visit https://localhost:3333 to login!"
fi
