# latest kali base image
FROM kalilinux/kali-rolling:latest

LABEL "project"="kali-sec"
LABEL "author"="f0nzy"
LABEL "version"="v1.1.1"
LABEL "website"="https://f0nzy.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install sudo

RUN groupadd --gid 1000 kali \
  && useradd --home-dir /home/kali --create-home --uid 1000 \
  --gid 1000 --shell /bin/bash --skel /dev/null kali

RUN chown -R kali:kali /home/kali/

RUN echo kali:kali | chpasswd

RUN usermod -aG sudo kali

RUN echo 'kali  ALL=(ALL) NOPASSWD:ALL' >>  /etc/sudoers.d/kali

WORKDIR /home/kali/

USER kali

RUN mkdir .logs && \
  mkdir -p .local/bin && \
  mkdir tools && \
  mkdir -p /home/kali/.config/tmuxp && \
  mkdir -p $HOME/.proxychains

ADD sources/0-base.sh /tmp/sources/0-base.sh

RUN sudo chmod +x /tmp/sources/0-base.sh && /tmp/sources/0-base.sh

ADD sources/1-tools.sh /tmp/sources/1-tools.sh

RUN sudo chmod +x /tmp/sources/1-tools.sh &&  /tmp/sources/1-tools.sh

ADD sources/2-tools.sh /tmp/sources/2-tools.sh

RUN sudo chmod +x /tmp/sources/2-tools.sh && /tmp/sources/2-tools.sh

ADD sources/3-wordlists.sh /tmp/sources/3-wordlists.sh

RUN sudo chmod +x /tmp/sources/3-wordlists.sh && /tmp/sources/3-wordlists.sh

RUN sudo chown -R kali:kali /tmp/sources/*

ADD sources/hakrawler /tmp/sources/hakrawler

ADD sources/jsleak /tmp/sources/jsleak

RUN cp /tmp/sources/hakrawler /home/kali/.local/bin/hakrawler \
  && chmod +x /home/kali/.local/bin/hakrawler && \
  cp /tmp/sources/jsleak /home/kali/.local/bin/jsleak && chmod +x /home/kali/.local/bin/jsleak


ADD resources /home/kali/resources/

RUN sudo chown -R kali:kali /home/kali/resources

RUN cp /home/kali/resources/tmux.conf /home/kali/.tmux.conf \
  && cp /home/kali/resources/bounty.yaml /home/kali/.config/tmuxp/bounty.yaml \
  && cp -r /home/kali/resources/bloodhound /home/kali/.config/bloodhound \
  && cp -r /home/kali/resources/shell-upgrade.sh /home/kali/tools/shell-upgrade.sh \
  && cp -r /home/kali/resources/recon.sh /home/kali/.local/bin/recon.sh && chmod +x /home/kali/.local/bin/recon.sh \
  && cp -r /home/kali/resources/proxychains.conf /home/kali/.proxychains/proxychains.conf \
  && cp -r /home/kali/resources/kerbrute /home/kali/.local/bin/kerbrute && chmod +x /home/kali/.local/bin/kerbrute

RUN git clone https://github.com/samratashok/nishang.git

RUN git clone https://github.com/gustanini/PowershellTools.git

RUN git clone https://github.com/aniqfakhrul/powerview.py

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
  --unattended

RUN cp /home/kali/resources/zsh/zshrc /home/kali/.zshrc

RUN cp /home/kali/resources/zsh/kali.zsh-theme /home/kali/.oh-my-zsh/themes/. \
  && cp /home/kali/resources/zsh/history /home/kali/.kali_history

RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

RUN sudo rm -rf /tmp/sources && sudo rm -rf /home/kali/resources

USER kali

RUN zsh



