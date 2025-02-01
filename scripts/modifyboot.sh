#!/bin/bash
if [ "$1" -eq 1 ]; then
    warning=$([ ! -f /tmp/up_param/svb_orange.jpg ] && [ ! -f /tmp/up_param/booting_warning.jpg ] && echo 1 || echo 0)
    rm -rf /tmp/up_param
    mkdir -p /tmp/up_param
    tar -xf /dev/block/by-name/up_param -C /tmp/up_param
    if [ $warning -eq 1 ]; then
        rm -f /tmp/up_param/{svb_orange.jpg,booting_warning.jpg}
    fi
elif [ "$1" -eq 2 ]; then
    chown root:root /tmp/up_param/* 
    chmod 444 /tmp/up_param/*.jpg 
    touch /tmp/up_param/*
    cd /tmp/up_param 
    tar -pcf /dev/block/by-name/up_param * 
    cd -
fi
