# BuildPhish
Simple bash script which installs and sets up Gophish as a service. Current version has been tested on Debian and Ubuntu.
If Gophish has been configured successfully as a service, it will also start on boot

## Install & Run
First download the repo with git, navigate into directory and make bash files executable:
```bash
$ git clone https://github.com/bl13pbl03p/buildphish.git
$ cd buildphish
$ chmod +x *.sh
```
Now you can run the script as root to build Gophish as service:
```bash
$ sudo ./buildphish.sh
 
    ____        _ __    ______  __    _      __  
   / __ )__  __(_) /___/ / __ \/ /_  (_)____/ /_ 
  / __  / / / / / / __  / /_/ / __ \/ / ___/ __ \
 / /_/ / /_/ / / / /_/ / ____/ / / / (__  ) / / /
/_____/\__,_/_/_/\__,_/_/   /_/ /_/_/____/_/ /_/
Made by bl13pbl03p                          v.0.1

[+] Let's build!
[+] Stoppped apache2
[+] Downloading Gophish
[+] Unzipping..
[+] Installed gophish
Failed to enable unit: File /etc/systemd/system/gophish.service already exists.
[+] Gophish is setup as service
[?] Check if service is running: sudo systemctl status gophish
[?] If service does not run, troubleshoot the /etc/systemd/system/gophish.service file
[*] Username is admin, view initial password with:
cat /var/log/gophish/gophish.log | grep 'Please login with the username admin and the password'
[*] Visit https://localhost:3333 to login
```
## Uninstall
You can run the cleanphish script as root to clean Gophish as service:
```bash

   ________                 ____  __    _      __  
  / ____/ /__  ____ _____  / __ \/ /_  (_)____/ /_ 
 / /   / / _ \/ __ `/ __ \/ /_/ / __ \/ / ___/ __ \
/ /___/ /  __/ /_/ / / / / ____/ / / / (__  ) / / /
\____/_/\___/\__,_/_/ /_/_/   /_/ /_/_/____/_/ /_/                     
Made by bl13pbl03p                            v.0.1

[-] Removing service
[-] Removing Gophish
[-] Removing logs
[-] Removing Gophish user
[+] Bye bye Gophish
```


## To do
- [x]  Build initial script
- [x]  Check if Gophish already exists as service
- [x]  Add uninstall script
- [x]  Add ASCII banner
- [ ]  Add loading bar when downloading and unzipping gophish
- [ ]  Add preview to README
- [ ]  More functions and fun stuff

## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.11.0)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
