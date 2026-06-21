#!/bin/bash -e

on_chroot << EOF

echo "Europe/Copenhagen" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
EOF

