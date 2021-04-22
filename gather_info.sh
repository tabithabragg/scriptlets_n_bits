#!/bin/bash

for a in $(cat servers.lst);
do
        echo "Pushing scraper to $a";
        scp -o Batchmode=yes -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ./scraper.sh $a:/tmp/ 2>/dev/null;
        echo "done";
        echo;
        echo;
done;

for a in $(cat servers.lst);
do
        echo "Scraping $a";
        ssh -tt -o Batchmode=yes -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $a "sudo chmod 755 /tmp/scraper.sh; sudo /tmp/scraper.sh | tee /tmp/$a.log" 2>/dev/null;
        scp -o Batchmode=yes -o ConnectTimeout=5 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $a:/tmp/$a.log ./ 2>/dev/null;
done;

for a in $(cat servers.lst);
do
        cat $a.log | grep -v refreshed >>servers_output.csv;
done;

