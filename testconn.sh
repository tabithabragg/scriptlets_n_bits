#!/bin/bash

## Test connection from controll system to target.  Part of script / scriptlet suite used to prep infra for mass patching.

for a in $(cat servers.lst);
do
        hnconn=$(ssh -tt -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o Batchmode=yes $a 'w=$(sudo whoami); h=$(sudo hostname); echo $h","$w' 2>/dev/null;)
        echo $a","${hnconn} | tee -a testconn.csv
done

