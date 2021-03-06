#/bin/bash

PATH=/sbin:/bin:/usr/bin:/usr/sbin
date >> /var/log/freepbx-update.log
fwconsole ma upgradeall >> /var/log/freepbx-update.log
wait ${!}
fwconsole chown >> /var/log/freepbx-update.log
wait ${!}
fwconsole ma refreshsignatures >> /var/log/system-update.log
wait ${!}
fwconsole reload >> /var/log/freepbx-update.log

chown -R asterisk:asterisk /var/log/asterisk
chown -R asterisk:asterisk /var/run/asterisk
chown -R asterisk:asterisk /var/lib/asterisk
chown -R asterisk:asterisk /var/log/asterisk/*
chown -R asterisk:asterisk /var/run/asterisk/*
chown -R asterisk:asterisk /var/lib/asterisk/*
