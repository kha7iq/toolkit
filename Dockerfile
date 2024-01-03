FROM alpine:3.19.0

RUN set -ex \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
    apache2-utils \
    bind-tools \
    bird \
    bridge-utils \
    busybox-extras \
    conntrack-tools \
    curl \
    dhcping \
    ethtool \
    file\
    fping \
    iftop \
    iperf \
    iperf3 \
    iproute2 \
    ipset \
    iptables \
    iptraf-ng \
    iputils \
    ipvsadm \
    httpie \
    jq \
    libc6-compat \
    liboping \
    ltrace \
    mtr \
    net-snmp-tools \
    netcat-openbsd \
    nftables \
    ngrep \
    nmap \
    nmap-nping \
    nmap-scripts \
    openssl \
    scapy \
    socat \
    speedtest-cli \
    openssh \
    w3m \
    strace \
    tcpdump \
    tcptraceroute \
    tshark \
    util-linux \
    vim \
    git \
    zsh \
    websocat \
    swaks \
    perl-crypt-ssleay \
    perl-net-ssleay \
    pgcli \
    py3-typing-extensions \
    mycli \
    litecli \
    termshark \
    grpcurl


# Add zsh plugins and keybindings
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions && \
    curl -L -sS https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/key-bindings.zsh -o $HOME/.zsh/zsh-keybindings.zsh


RUN echo "precmd() { print '' }" >> ${HOME}/.zshrc && \
    echo "PS1='%F{cyan}%K{#231930} %m %K{#6d95b3}%F{#231930}%F{#231930} %F{#231930}%b%2~ %f%f%k%F{#6d95b3} '" >> ${HOME}/.zshrc && \
    echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${HOME}/.zshrc && \
    echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc && \
    echo "source $HOME/.zsh/zsh-keybindings.zsh" >> ${HOME}/.zshrc && \
    echo "alias vi='vim'" >> ${HOME}/.zshrc && \
    echo "alias ll='ls -lh'" >> ${HOME}/.zshrc

WORKDIR /root

CMD ["zsh"]
