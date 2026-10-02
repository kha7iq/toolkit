FROM alpine:3.24

ENV HOME=/root

RUN set -eux; \
    apk add --no-cache \
        apache2-utils \
        bind-tools \
        busybox-extras \
        curl \
        ethtool \
        file \
        fping \
        git \
        httpie \
        iftop \
        iperf3 \
        iproute2 \
        iptables \
        iputils \
        jq \
        mtr \
        netcat-openbsd \
        nftables \
        nmap \
        nmap-ncat \
        nmap-nping \
        nmap-scripts \
        openssh-client \
        openssl \
        perl \
        procps \
        socat \
        strace \
        tcpdump \
        tcptraceroute \
        tshark \
        util-linux \
        vim \
        websocat \
        w3m \
        zsh; \
    curl -fsSL \
        "https://github.com/minio/mc/releases/download/RELEASE.2025-08-13T08-35-41Z/mc.linux-amd64.RELEASE.2025-08-13T08-35-41Z" \
        -o /usr/local/bin/mc; \
    chmod 0755 /usr/local/bin/mc; \
    mkdir -p "$HOME/.zsh"; \
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$HOME/.zsh/zsh-syntax-highlighting"; \
    git clone --depth=1 \
        https://github.com/zsh-users/zsh-autosuggestions.git \
        "$HOME/.zsh/zsh-autosuggestions"; \
    curl -fsSL \
        https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/key-bindings.zsh \
        -o "$HOME/.zsh/zsh-keybindings.zsh"; \
    rm -rf /var/cache/apk/*

RUN set -eux; \
    { \
        echo "precmd() { print '' }"; \
        echo "PS1='%F{cyan}%K{#231930} %m %K{#6d95b3}%F{#231930}%F{#231930} %F{#231930}%b%2~ %f%f%k%F{#6d95b3} '"; \
        echo "source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"; \
        echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; \
        echo "source $HOME/.zsh/zsh-keybindings.zsh"; \
        echo "alias vi='vim'"; \
        echo "alias ll='ls -lh'"; \
    } >> "$HOME/.zshrc"

WORKDIR /root

CMD ["zsh"]