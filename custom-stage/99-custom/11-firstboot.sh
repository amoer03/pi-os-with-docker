#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/firstboot-script.service "${ROOTFS_DIR}/etc/systemd/system/firstboot-script.service"

on_chroot << EOF

sudo systemctl daemon-reload
sudo systemctl enable firstboot-script.service

EOF
