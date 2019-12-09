#!/bin/bash

srv_name=bbnet_ger1
gitpath=/home/$USER/git/LogsBBNet

logfile=$gitpath/${srv_name}/${srv_name}_$(date +%F_%H-%M-%S).log
gdb --args ./${srv_name}_srv_d "logfile $logfile;#sid:bbnet-ger1-07"

