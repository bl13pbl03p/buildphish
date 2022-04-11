# Installment
sudo service apache2 stop
echo "[+] Stoppped apache2"
echo "[+] Downloading Gophish"
wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip
sudo unzip gophish-v0.11.0-linux-64bit.zip -d /opt/gophish
sudo chmod +x /opt/gophish/gophish
echo "[+] Installed gophish"

# Setting up as service
sudo useradd -r gophish
sudo mv gophish.service /etc/systemd/system/
sudo mkdir /var/log/gophish
sudo chown -R gophish:gophish /opt/gophish/ /var/log/gophish/
sudo setcap cap_net_bind_service=+ep /opt/gophish/gophish
sudo systemctl daemon-reload
sudo systemctl start gophish
sudo systemctl enable gophish
echo "[+] Gophish is setup as service"
echo "[?] Check if service is running: sudo systemctl status gophish"
echo "[?] If service does not run, troubleshoot the /etc/systemd/system/gophish.service file"
echo "[*] Visit https://localhost:3333 to login"
echo "[*] Execute the script beneath to retrieve the initial username and password"
echo "cat /var/log/gophish/gophish.log | grep 'Please login with the username admin and the password'
