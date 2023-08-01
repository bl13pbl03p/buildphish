# BuildPhish
Simple bash script which downloads, installs and sets up GaaS: Gophish as a Service. Current version (Gophish Linux 64-bit v0.12.1) has been tested on Debian and Ubuntu. If Gophish has been configured successfully as a service, it will also start on boot.

## Install & Run
First download the repo with git, navigate into directory and make the bash files executable.

Open your terminal and enter the following commands:
```bash
git clone https://github.com/bl13pbl03p/buildphish.git
cd buildphish
chmod +x *.sh
```
Now you can run the script to build Gophish as a Service:

<img src="https://github.com/bl13pbl03p/buildphish/assets/22095577/63778ee4-a1c6-4cbb-af2e-9e17effc4164" width=600px height=450px>


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
- [ ]  Check if Apache2 service exists
- [x]  Add nice colors [Possible helpful docs](https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4#:~:text=The%20escape%20sequence%20for%20specifying,option%20to%20enable%20their%20interpretation.&text=The%20%5Ce%5B0m%20means%20we,text%20color%20back%20to%20normal.)
- [x]  Hash check of zip file
- [ ]  Make cross-platform
- [ ]  Show initial password
- [x]  Add loading bar when downloading and unzipping gophish
- [x]  Add preview to README
- [ ]  More functions and fun stuff
- [ ]  Upgrade to Evilgophish
 - [ ] Create user evilgophish  
## Errors
The following error might occur while installing:
```bash
Failed to enable unit: File /etc/systemd/system/gophish.service already exists.
```
The error can be ignored, for more info see: https://unix.stackexchange.com/questions/351692/how-can-we-mask-service-whose-unit-file-is-located-under-etc-systemd-system
## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.12.1)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
- [Creating banner](https://manytools.org/hacker-tools/ascii-banner/)
