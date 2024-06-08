#!/bin/bash

mkdir -p $HOME/.config && cp /home/kali/resources/tmux.conf /home/kali/.tmux.conf &&
	cp -r /home/kali/resources/shell-upgrade.sh /home/kali/tools/shell-upgrade.sh &&
	cp -r /home/kali/resources/recon.sh /home/kali/.local/bin/recon.sh && chmod +x /home/kali/.local/bin/recon.sh &&
	cp -r /home/kali/resources/proxychains.conf /home/kali/.proxychains/proxychains.conf &&
	cp -r /home/kali/resources/kerbrute /home/kali/.local/bin/kerbrute && chmod +x /home/kali/.local/bin/kerbrute &&
	cp -r /home/kali/resources/smbserver.py /home/kali/tools/smbserver.py &&
	cp -r /home/kali/resources/bash/history /home/kali/.history &&
	cp -r /home/kali/resources/htb.yaml /home/kali/.config/tmuxp/htb.yaml

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp /home/kali/resources/zsh/.zshrc $HOME/.zshrc

cp /home/kali/resources/zsh/kali.zsh-theme $HOME/.oh-my-zsh/custom/themes/kali.zsh-theme

cp /home/kali/resources/zsh/.zprofile $HOME/.zprofile

cp /home/kali/resources/bash/history .commands

mkdir .zsh

cp /home/kali/resources/zsh/functions.sh $HOME/.zsh/functions.sh

cp -r /home/kali/resources/zsh/aliases $HOME/.zsh/aliases
