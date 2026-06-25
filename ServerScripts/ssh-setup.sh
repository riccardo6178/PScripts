#!/bin/bash

set -euo pipefail
if [ "$EUID" -ne 0 ]; then
    echo "Eseguire come root" >&2
    exit 1
fi

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
grep -q '^PasswordAuthentication' /etc/ssh/sshd_config || echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
grep -q '^PermitRootLogin' /etc/ssh/sshd_config || echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config

if [ -d /root/.ssh ]; then
	touch /root/.ssh/authorized_keys
	chmod 600 /root/.ssh/authorized_keys
	echo 'your-key' >> /root/.ssh/authorized_keys	
	mkdir /root/.ssh 2>/dev/null
fi

