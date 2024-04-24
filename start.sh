#!/bin/bash
option=${1:---install}

if [ ${option} = "--install" ]
then
    /usr/bin/vh --install
elif [ ${option} = "--run" ]
then
    # timeout for verlihub tcp
    echo sleep 60 seconds
    sleep 60
    TERM=xterm

    /usr/local/bin/vh_daemon /usr/local/bin/verlihub
fi
