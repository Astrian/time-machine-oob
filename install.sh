#!/bin/bash

groupadd -g $TM_GID $TM_USERNAME
useradd -u $TM_UID -g $TM_GID -d /home/$TM_USERNAME -m $TM_USERNAME
echo "$TM_USERNAME:$TM_PASSWORD" | chpasswd
mkdir -p /timemachine_backup
chown -R $TM_USERNAME:$TM_USERNAME /timemachine_backup

echo "[${TM_SHARENAME}]" >> /etc/netatalk/afp.conf
echo "path = /timemachine_backup" >> /etc/netatalk/afp.conf
echo "time machine = yes" >> /etc/netatalk/afp.conf
echo "vol size limit = $TM_VOL_LIMIT" >> /etc/netatalk/afp.conf

/etc/init.d/dbus start
/etc/init.d/avahi-daemon start
/etc/init.d/netatalk start
tail -f /dev/null