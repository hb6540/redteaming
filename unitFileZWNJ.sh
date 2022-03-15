#!/bin/bash

for service in $(find /usr/lib/systemd/system -maxdepth 1 -type f)
do sed -i 's/ExecStart=/ExecStart=/g' $service
done
