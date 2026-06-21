#!/bin/bash -e

on_chroot << 'EOF'
echo "raspberrypi" > /etc/hostname

# ensure hosts file matches
sed -i 's/127.0.1.1.*/127.0.1.1\traspberrypi/' /etc/hosts
EOF

