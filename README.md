# BuildPhish
Simple bash script which downloads, installs and sets up GaaS: Gophish as a Service. Current version (Gophish Linux 64-bit v0.11.0) has been tested on Debian and Ubuntu. If Gophish has been configured successfully as a service, it will also start on boot.

## Install & Run
First download the repo with git, navigate into directory and make the bash files executable.

Open your terminal and enter the following commands:
```bash
git clone https://github.com/bl13pbl03p/buildphish.git
cd buildphish
chmod +x *.sh
```
Now you can run the script to build Gophish as a Service:
```bash
sudo ./buildphish.sh
 
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
[+] Gophish is setup as service
[?] Check if service is running: sudo systemctl status gophish
[?] If service does not run, troubleshoot the /etc/systemd/system/gophish.service file
[*] Username is admin, view initial password with:
cat /var/log/gophish/gophish.log | grep 'Please login with the username admin and the password'
[*] Visit https://localhost:3333 to login
```
## Uninstall
You can run the cleanphish script to clean Gophish as service:
```bash
sudo ./cleanphish.sh
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
- [ ]  Function which adds phishing redirect page
- [ ]  Hash check of zip file
- [ ]  Make cross-platform
- [ ]  Add loading bar when downloading and unzipping gophish
- [x]  Add preview to README
- [ ]  More functions and fun stuff
## Errors
The following error might occur while installing:
```bash
Failed to enable unit: File /etc/systemd/system/gophish.service already exists.
```
The error can be ignored, for more info see: https://unix.stackexchange.com/questions/351692/how-can-we-mask-service-whose-unit-file-is-located-under-etc-systemd-system
## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.11.0)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
- [Creating banner](https://manytools.org/hacker-tools/ascii-banner/)
