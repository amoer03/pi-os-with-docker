#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/docker"
install -m 644 files/daemon.json "${ROOTFS_DIR}/etc/docker/daemon.json"

on_chroot << EOF

systemctl enable docker

# optional but recommended for Raspberry Pi OS default user
if id "${FIRST_USER_NAME}" >/dev/null 2>&1; then
  usermod -aG docker "${FIRST_USER_NAME}"
fi

EOF
