#!/bin/bash -e

install -m 644 files/boot-hostname.service "${ROOTFS_DIR}/etc/systemd/system/boot-hostname.service"
install -m 755 files/boot-hostname.sh "${ROOTFS_DIR}/usr/local/sbin/boot-hostname.sh"

on_chroot << 'EOF'

systemctl enable boot-hostname.service

EOF
