<h2 align="center">
  <p align="center"><img width=30% src="./.github/img/logo.png"></p>
</h2>

<p align="center">
  <a href="#getting-started">Getting Started</a> •
  <a href="#toolkit-with-docker">Toolkit with Docker</a> •
  <a href="#toolkit-with-kubernetes">Toolkit with Kubernetes</a> •
  <a href="#tools-included">Tools Included</a> •
  <a href="#acknowledgments">Acknowledgments</a> •
</p>


# Network ToolKit
This container is build to assist in troubleshooting networking issues within Kubernetes or Docker environments.
It comes pre-installed with a suite of networking tools to facilitate diagnosis and resolution of common networking problems.

## Getting Started

### Toolkit with Docker

Use the `khaliq/toolkit` image for troubleshooting networking:

* **Container's Network Namespace:** Investigate networking issues within a container's network namespace:

    ```bash
    docker run -it --rm --name toolkit khaliq/toolkit
    ```

* **Host's Network Namespace:** Investigate host-related networking issues:

    ```bash
    docker run -it --rm --name toolkit --net host khaliq/toolkit
    ```

## Toolkit with Kubernetes

* Create a throw away pod:

    ```bash
    kubectl run toolkit --rm -i --tty --image khaliq/toolkit
    ```

* Create a throw away pod in the host's network namespace:

    ```bash
    $ kubectl run toolkit --rm -i --tty --overrides='{"spec": {"hostNetwork": true}}' --image khaliq/toolkit
    ```
    

### Alias
Consider adding alias to your `.bashrc` or `.zshrc` for convenience.
  ```bash
  # Docker
  echo "alias drt='docker run -it --rm --name toolkit khaliq/toolkit:latest'" >> $HOME/.zshrc
  # Kubernetes
  echo "alias krt='kubectl run toolkit --rm -i --tty --image khaliq/toolkit:latest'" >> $HOME/.zshrc
  ``` 

## Tools Included
- [apache2-utils](https://httpd.apache.org/docs/2.4/programs/ab.html) - Apache HTTP server benchmarking tool.
- [bind-tools](https://www.isc.org/bind/) - Utilities for querying DNS name servers.
- [bird](https://bird.network.cz/) - Internet routing software.
- [bridge-utils](https://wiki.linuxfoundation.org/networking/bridge) - Utilities for configuring the Linux Ethernet bridge.
- [busybox-extras](https://www.busybox.net/) - Collection of basic Unix utilities.
- [conntrack-tools](https://netfilter.org/projects/conntrack-tools/index.html) - Tools for interacting with Netfilter connection tracking system.
- [curl](https://curl.se/) - Command-line tool for transferring data with URLs.
- [dhcping](https://github.com/ndilieto/dhcping) - DHCP packet tester.
- [ethtool](https://mirrors.edge.kernel.org/pub/software/network/ethtool/) - Utility for querying and modifying network interface parameters.
- [file](https://www.darwinsys.com/file/) - Command-line tool to determine file type.
- [fping](https://fping.org/) - Command-line tool to ping multiple hosts simultaneously.
- [iftop](https://www.ex-parrot.com/~pdw/iftop/) - Network bandwidth monitoring tool.
- [iperf](https://iperf.fr/) - Tool for measuring TCP and UDP bandwidth performance.
- [iperf3](https://software.es.net/iperf/) - Improved version of iperf for measuring TCP and UDP bandwidth performance.
- [iproute2](https://wiki.linuxfoundation.org/networking/iproute2) - Collection of utilities for controlling TCP/IP networking.
- [ipset](https://ipset.netfilter.org/) - Manage IP sets.
- [iptables](https://netfilter.org/) - Administration tool for IPv4/IPv6 packet filtering and NAT.
- [iptraf-ng](https://wiki.linuxfoundation.org/networking/iptraf-ng) - Real-time network statistics utility.
- [iputils](https://wiki.linuxfoundation.org/networking/iputils) - Set of common network utilities.
- [ipvsadm](https://wiki.linuxvirtualserver.org/) - Utility to administer the IPVS (IP Virtual Server) kernel module.
- [httpie](https://httpie.io/) - User-friendly HTTP client.
- [jq](https://stedolan.github.io/jq/) - Command-line JSON processor.
- [libc6-compat](https://www.gnu.org/software/libc/) - Compatibility library for GNU C Library.
- [liboping](https://noping.cc/) - Library to generate ICMP echo requests.
- [ltrace](https://ltrace.org/) - Library call tracer.
- [mtr](https://www.bitwizard.nl/mtr/) - Network diagnostic tool combining ping and traceroute.
- [net-snmp-tools](https://www.net-snmp.org/) - SNMP utilities.
- [netcat-openbsd](http://man.openbsd.org/nc) - Networking utility for reading/writing data across network connections.
- [nftables](https://wiki.nftables.org/) - Firewalling framework.
- [ngrep](https://github.com/jpr5/ngrep) - Network grep.
- [nmap](https://nmap.org/) - Network exploration tool and security scanner.
- [nmap-nping](https://nmap.org/) - Network packet generation tool.
- [nmap-scripts](https://nmap.org/) - Scripts for nmap.
- [openssl](https://www.openssl.org/) - Cryptography toolkit.
- [scapy](https://scapy.net/) - Interactive packet manipulation tool.
- [socat](http://www.dest-unreach.org/socat/) - Multipurpose relay for bidirectional data transfer.
- [speedtest-cli](https://github.com/sivel/speedtest-cli) - Command-line interface for speedtest.net.
- [openssh](https://www.openssh.com/) - Secure shell (SSH) tools.
- [w3m](http://w3m.sourceforge.net/) - Text-based web browser.
- [strace](https://strace.io/) - System call tracer.
- [tcpdump](https://www.tcpdump.org/) - Network packet analyzer.
- [tcptraceroute](https://github.com/mct/tcptraceroute) - Traceroute implementation using TCP packets.
- [tshark](https://www.wireshark.org/docs/man-pages/tshark.html) - Command-line network protocol analyzer.
- [util-linux](https://github.com/karelzak/util-linux) - Collection of basic system utilities.
- [vim](https://www.vim.org/) - Text editor.
- [git](https://git-scm.com/) - Distributed version control system.
- [zsh](https://www.zsh.org/) - Unix shell.
- [websocat](https://github.com/vi/websocat) - WebSocket Swiss Army Knife.
- [swaks](https://www.jetmore.org/john/code/swaks/) - SMTP transaction tester.
- [perl-crypt-ssleay](https://metacpan.org/release/Crypt-SSLeay) - Perl module providing SSL and TLS functionality.
- [perl-net-ssleay](https://metacpan.org/release/Net-SSLeay) - Perl extension for using OpenSSL.
- [pgcli](https://www.pgcli.com/) - Command-line interface for Postgres with auto-completion and syntax highlighting.
- [mycli](https://www.mycli.net/) - Command-line interface for MySQL with auto-completion and syntax highlighting.
- [litecli](https://litecli.com/) - Command-line interface for SQLite with auto-completion and syntax highlighting.
- [termshark](https://termshark.io/) - Terminal UI for Wireshark.
- [grpcurl](https://github.com/fullstorydev/grpcurl) - Command-line tool for gRPC.


## Issues
If you encounter any problems or have suggestions for improvements, please [open an issue](https://github.com/kha7iq/toolkit/issues) on GitHub.

## Acknowledgments
This project was inspired by [Netshoot](https://github.com/nicolaka/netshoot), a similar collection of networking troubleshooting tools.
I extend my gratitude to the creators and contributors of Netshoot for their valuable work, which served as an inspiration for this project.
