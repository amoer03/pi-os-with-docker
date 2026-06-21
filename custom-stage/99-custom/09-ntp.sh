#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/etc/systemd/timesyncd.conf.d"
install -m 644 files/10-ntp.conf "${ROOTFS_DIR}/etc/systemd/timesyncd.conf.d/10-ntp.conf"
