![Logo](https://ka-tet.s3.amazonaws.com/logo_long.png)                                                                                                                                           
![Logo](https://img.shields.io/docker/image-size/fonalex45/aegis) ![Logo](https://img.shields.io/docker/pulls/fonalex45/aegis)       

Aegis is a docker image designed for any engagement. Gone are the days of spinning up an entire Kali virtual machine or installing on bare metal. This image offers a flexible, repeatable environment for penetration testers, security researchers and analysts alike.


## Acknowledgements

 I pulled alot of inspiration from this awesome project and can only hope my project is as awesome as this one is.
 
- [Exegol - Fully featured and community-driven hacking environment](https://github.com/ThePorgs/Exegol)

## Features

- Bash script executable
- Command history logging via `script`
- Persistant containers, volumes and workspaces
- Customizable resources and tooling, config files are located in the `resources/` & `sources/` directories
- Non-root container w/ sudo
- Tmux inside the container (my favorite feature)


### Custom aliases included:

```
alias cme='nxc'
alias port-scan='sudo nmap -sC -sV -p- $IP > scan.txt'
alias udp-scan='sudo nmap -sU --top-ports 10 $IP -v > udp.scan.txt'
alias stealth-scan='sudo nmap --data-length 6 -T3 -A -ttl 64 -p- $IP > stealth-scan.txt'
alias public='curl wtfismyip.com/text'
alias t='tmux new -f ~/.tmux.conf -s $1'
alias webserver="miniserve -p 8001"
alias :q='exit'
alias home='cd ~'
alias :r='. ~/.bashrc'
alias update='sudo apt update'
alias upgrade='sudo apt-get upgrade -y'
alias i='sudo apt install -y'
alias ls='ls --color=auto'
alias command='cat $HOME/.commands'
alias proxy='proxychains'
alias serve='sudo python3 -m http.server 80'
```

## Installation


**The script has one dependency: gum. this can be installed via your distro's package manager**

1. Clone the repo:
`git clone https://github.com/alexrf45/aegis.git && cd aegis`

2. Run the following commands to make the script ready for use:

```bash
$ cp aegis $HOME/.local/bin/. \
&& chmod +x $HOME/.local/bin/aegis \
&& source $HOME/.bashrc
```
## Usage/Examples

```bash
aegis start - start a container
aegis stop - stop a container
aegis enter- enter running container
aegis destory - destory a container
aegis backup - backup shared volume
aegis pull - update to latest image (dev, latest)
aegis help - view this help menu

```

Command list:

- Tired of looking for a specific command or long one liner? You can use this handy alias to search the prebuilt history for commonly used commands

```
alias command='cat $HOME/.commands'
```

TODO:
- add quick https server script
- Python wrapper (FUTURE)
- Revamp bash function into script (alpha)
