#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/sudoers.d"
echo "${FIRST_USER_NAME} ALL=(root) NOPASSWD: /usr/bin/date, /usr/bin/timedatectl" > "${ROOTFS_DIR}/etc/sudoers.d/set-date"
chmod 440 "${ROOTFS_DIR}/etc/sudoers.d/set-date"
