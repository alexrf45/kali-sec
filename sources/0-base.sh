#!/bin/bash

base() {
	sudo apt-get install -y \
		wget curl man git lolcat \
		figlet tmux tree mousepad \
		hexcurse file ruby ruby-dev \
		vim nano p7zip-full kali-themes \
		djvulibre-bin python3-pip \
		python3-virtualenv libpcap-dev \
		jq xpdf pipx man-db exploitdb \
		rpcbind nfs-common feh cmake \
		ntp ntpdate bash-completion zsh
}

network() {
	sudo apt-get install -y \
		netcat-traditional socat \
		rlwrap nmap \
		netdiscover masscan \
		dnsutils onesixtyone \
		braa tcpdump \
		ftp telnet swaks \
		snmpcheck snmpcheck \
		snmp-mibs-downloader iputils-ping \
		iproute2 proxychains \
		sendmail ltrace \
		raven faketime mitmproxy \
		netexec
}

active_directory() {
	sudo apt-get install -y \
		smbclient evil-winrm \
		responder powershell \
		ldap-utils enum4linux-ng \
		bloodhound.py
}

osint_tools() {
	sudo apt-get install -y \
		csvtool vinetto \
		sqlitebrowser exiflooter \
		h8mail reconspider \
		sn0int cewl seclists sploitscan
}

base
network
active_directory
osint_tools

mkdir -p $HOME/.local/bin

mkdir -p $HOME/.logs

mkdir -p $HOME/tools

mkdir -p $HOME/.proxychains

mkdir -p $HOME/.config/tmuxp
