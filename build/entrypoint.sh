#!/bin/sh

if [ -z ${PUID} ]
then
    PUID=1000
fi

if [ -z ${PGID} ]
then
    PGID=1000
fi

usermod -u ${PUID} lhs >/dev/null
groupmod -g ${PGID} lhs >/dev/null
chown -R lhs:lhs /home/lhs

export PATH=$PATH:$HOME/hsj/bin

if [ ! -f /home/lhs/data/config.dct ]
then
    gosu ${PUID}:${PGID} /home/lhs/hsj/bin/hdl-setup-server /home/lhs/data
    sleep 3
fi

rm -f /home/lhs/data/txns/lock
gosu ${PUID}:${PGID} /home/lhs/hsj/bin/hdl-server /home/lhs/data
