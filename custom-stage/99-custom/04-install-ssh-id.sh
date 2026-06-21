#!/bin/bash -e

install -m 755 files/install-ssh-key.sh "${ROOTFS_DIR}/usr/local/bin/install-ssh-key.sh"
install -m 644 files/install-ssh-key.service "${ROOTFS_DIR}/etc/systemd/system/install-ssh-key.service"

# enable service on first boot
on_chroot << EOF
systemctl enable install-ssh-key.service
EOF
