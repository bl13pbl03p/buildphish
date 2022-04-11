# BuildPhish
Simple bash script which installs and sets up Gophish as a service. Current version has been tested on Debian and Ubuntu.

## Install & Run
First download the repo with git, navigate into directory and make bash file executable:
```bash
$ git clone https://github.com/bl13pbl03p/buildphish.git
$ cd buildphish
$ chmod +x buildphish.sh
```
Now you can run the script as root:
```bash
$ sudo ./buildphish.sh
```

## To do
- [x]  Build initial script
- [ ]  Check if Gophish already exists as service
- [ ]  Add uninstall script
- [ ]  Add ASCII banner
- [ ]  Add preview to README
- [ ]  Succesfully configure gophish.service file on initial run while adding '>>'
- [ ]  More functions and fun stuff

## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.11.0)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
