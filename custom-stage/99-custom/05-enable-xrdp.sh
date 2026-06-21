#!/bin/bash -e

on_chroot << EOF
systemctl enable xrdp
systemctl enable xrdp-sesman

# Fix session
sed -i 's|^exec .*|exec startlxde-pi|' /etc/xrdp/startwm.sh

EOF
