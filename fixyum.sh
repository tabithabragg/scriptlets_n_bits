#!/bin/bash
## symlink /var/cache/yum to /tmp/yumpatch to mitigate a bone-headed disk provisioning decision made years ago by someone who didn't know what they were doing. 
## on most affected systems, /var is too small or worse,  /var is not a seperate volume from / and is *still* too small.  

yum clean all;

YUMDIR=/var/cache/yum
YUMDIROLD=/var/cache/yumold
YUMTMP=/tmp/yumpatch

if [ ! -d "$YUMTMP" ]; then
        mkdir "$YUMTMP";
else
        echo "ERROR: /tmp/yum exists already";
        exit
fi;

if [ ! -L "$YUMDIR" &&  -d "$YUMDIR" ]; then
        mv "$YUMDIR" "$YUMDIROLD";
else
        if [ -L "$YUMDIR" ]; then
                mv "$YUMDIR" "$YUMDIROLD";
        fi;
fi;

if [ -d "$YUMTMP" ] && [ ! -L "$YUMDIR" ]; then
        ln -s "$YUMTMP" "$YUMDIR"
else
        echo "Error:  I can not do that Dave."
        exit
fi;
