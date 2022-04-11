# BuildPhish
Simple bash script which installs and sets up Gophish as a service. Current version has been tested on Debian and Ubuntu.

## Install & Run
First download the bash script with either curl or wget, thereafter make it executable:
```bash
# Curl
$ curl https://raw.githubusercontent.com/bl13pbl03p/buildphish/main/buildphish.sh --output buildphish.sh && chmod 700 buildphish.sh

# Wget
$ wget https://raw.githubusercontent.com/bl13pbl03p/buildphish/main/buildphish.sh && chmod 700 buildphish.sh
```
Now you can run the script as root:
```bash
$ sudo ./buildphish.sh
```

## To do
- [x]  Build initial script
- [ ]  Add ASCII banner
- [ ]  Add preview to README
- [ ]  Succesfully configure gophish.service file on initial run while adding '>>'
- [ ]  More functions and fun stuff

## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.11.0)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
