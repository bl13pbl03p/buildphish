# BuildPhish
Simple bash script which downloads, installs and sets up GaaS: Gophish as a Service. Current version (Gophish Linux 64-bit v0.12.1, **Evilginx compatible**) has been tested on Debian. If Gophish has been configured successfully as a service, it will also start on boot.

Thanks [@jordan-wright](https://github.com/jordan-wright) for creating Gophish, [@kgretzky](https://github.com/kgretzky) for creating Evilginx and the rest of the contributors, your tools have been really helpful along the way :)

## Requirements
You need to have access to remote/local server running Debian OS or similar with following requirements:
- At least 1GB RAM and at least 1 CPU.
- Non-root user in sudoers group with preconfigured authorized_keys SSH keys to allow for passwordless login.
- Check out https://help.evilginx.com/community/getting-started/deployment/remote#requirements

## Install & Run
First download the repo with git, navigate into directory, make the bash files executable and run them!

Open your terminal, enter the following bash one-liner to download and install Gophish:
```bash
git clone https://github.com/bl13pbl03p/buildphish.git && cd buildphish && chmod +x *.sh && sudo ./buildphish.sh
```

[![asciicast](https://asciinema.org/a/eoCJo7V1TJcygDh4w8DXHfjn2.svg)](https://asciinema.org/a/eoCJo7V1TJcygDh4w8DXHfjn2)


## Uninstall
You can run the cleanphish script to clean Gophish as service:
```bash
sudo ./cleanphish.sh
```
## To do
- [x]  Build initial script
- [x]  Check if Gophish already exists as service
- [x]  Add uninstall script
- [x]  Add ASCII banner
- [x]  Check if Apache2 service exists
- [x]  Add nice colors [Possible helpful docs](https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4#:~:text=The%20escape%20sequence%20for%20specifying,option%20to%20enable%20their%20interpretation.&text=The%20%5Ce%5B0m%20means%20we,text%20color%20back%20to%20normal.)
- [x]  Hash check of zip file
- [x]  Show initial password
- [x]  Add loading bar when downloading and unzipping gophish
- [x]  Add preview to README
- [ ]  Create function to echo API key from Gophish
- [ ]  More functions and fun stuff
  
## Known issues
- The error can be ignored, for more info see: https://unix.stackexchange.com/questions/351692/how-can-we-mask-service-whose-unit-file-is-located-under-etc-systemd-system. The following error might occur while installing:
```bash
Failed to enable unit: File /etc/systemd/system/gophish.service already exists.
```
- If the script fails to retrieve the generated password, run the following command manually:
```bash
grep --color=always --word-regexp 'Please login with the username admin and the password' /var/log/gophish/gophish.log | cut -d' ' -f12- | tr -d '"'
```

## Resources
- [Latest Gophish Release](https://github.com/gophish/gophish/releases/tag/v0.12.1)
- [Install Gophish on Ubuntu 18.04/Debian 9.8](https://kifarunix.com/install-gophish-on-ubuntu-18-04-debian-9-8/)
- [Official Gophish Docs](https://getgophish.com/documentation/)
- [Creating banner](https://manytools.org/hacker-tools/ascii-banner/)
- [Evilginx 3.3 - Go & Phish](https://breakdev.org/evilginx-3-3-go-phish/)

## License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
