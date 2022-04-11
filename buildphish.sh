# Installment
sudo service apache2 stop
echo "[+] Stoppped apache2"
wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip
sudo unzip gophish-v0.11.0-linux-64bit.zip -d /opt/gophish
sudo chmod +x /opt/gophish/gophish
echo "[+] Installed gophish"

# Setting up as service
sudo useradd -r gophish
sudo cat << EOF >> /etc/systemd/system/gophish.service
[Unit]
Description=Gophish is an open-source phishing toolkit
Documentation=https://getgophish.com/documentation/
After=network.target

[Service]
WorkingDirectory=/opt/gophish
User=gophish
Environment='STDOUT=/var/log/gophish/gophish.log'
Environment='STDERR=/var/log/gophish/gophish.log'
PIDFile=/var/run/gophish
ExecStart=/bin/sh -c '/opt/gophish/gophish >>${STDOUT} 2>>${STDERR}'

[Install]
WantedBy=multi-user.target
Alias=gophish.service
EOF

sudo mkdir /var/log/gophish
sudo chown -R gophish:gophish /opt/gophish/ /var/log/gophish/
sudo setcap cap_net_bind_service=+ep /opt/gophish/gophish
sudo systemctl daemon-reload
sudo systemctl start gophish
sudo systemctl enable gophish
sudo systemctl status gophish
echo "[+] Gophish is setup as service"
echo "[?] If service does not run, check the /etc/systemd/system/gophish.service"
echo "[?] This must be include in the file above: /opt/gophish/gophish >>${STDOUT} 2>>${STDERR}"
echo "[*] Execute the script beneath to retrieve the initial password"
echo "cat /var/log/gophish/gophish.log | grep 'Please login with the username admin and the password'
