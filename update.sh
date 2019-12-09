#!/bin/bash

gitpath=/home/$USER/git/ddnet7
cwd=$(pwd)
cd $gitpath || exit 1

mkdir -p build
cd build || exit 1
git pull
cmake .. -DMYSQL=ON -DCMAKE_BUILD_TYPE=Debug
make -j6
mv DDNet-Server $cwd/bbnet_ger1_srv_d

