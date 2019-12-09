#!/bin/bash

gitpath=/home/$USER/git/LogsBBNet
srv_name=bbnet_ger1

function show_latest_logs() {
    logpath=$1
    show=$2
    if [ ! -d $logpath ]
    then
        echo "logpath not found '$logpath'"
        exit
    fi
    latest_log=$(ls $logpath | tail -n1)
    latest_log="$logpath$latest_log"
    echo "$latest_log"
    if [ "$show" == "1" ]
    then
        less $latest_log
    fi
}

show_latest_logs "$gitpath/$srv_name/" "1"

