#!/bin/bash

# If there is some public key in keys folder
# then it copies its contain in authorized_keys file
if [ "$(ls -A /src/keys/)" ]; then
	cd /home/git
	cat /src/keys/*.pub > .ssh/authorized_keys
	chown -R git:git .ssh
	chmod 700 .ssh
	chmod -R 600 .ssh/*
fi

if [ "$(ls -A /srv/git/)" ]; then
	cd /srv/git
	chown -R git:git .
	chmod -R ug+rwX .
	find . -type d -exec chmod g+s '{}' +
fi

echo "Starting SSHD"

/usr/sbin/sshd -D -f /etc/ssh/sshd_config
