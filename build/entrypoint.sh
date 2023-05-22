#!/bin/sh

export PATH=$PATH:$HOME/hsj/bin

if [ ! -f /home/lhs/data/config.dct ]
then
    /home/lhs/hsj/bin/hdl-setup-server /home/lhs/data
    sleep 3
fi

/home/lhs/hsj/bin/hdl-server /home/lhs/data
