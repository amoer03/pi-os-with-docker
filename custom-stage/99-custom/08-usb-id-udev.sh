#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/udev/rules.d"
install -m 644 files/60-kmt.rules "${ROOTFS_DIR}/etc/udev/rules.d/60-kmt.rules"
