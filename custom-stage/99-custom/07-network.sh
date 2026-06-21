#!/bin/bash -e

# eth1

mkdir -p "${ROOTFS_DIR}/etc/NetworkManager/system-connections"

cat > "${ROOTFS_DIR}/etc/NetworkManager/system-connections/usb-lan-1.nmconnection" <<'EOF'
[connection]
id=usb-lan-1
type=ethernet
interface-name=eth1
autoconnect=true

[ipv4]
method=manual
address1=192.168.0.2/24
never-default=true

[ipv6]
method=disabled
EOF

chmod 600 "${ROOTFS_DIR}/etc/NetworkManager/system-connections/usb-lan-1.nmconnection"

# eth2

mkdir -p "${ROOTFS_DIR}/etc/NetworkManager/system-connections"

cat > "${ROOTFS_DIR}/etc/NetworkManager/system-connections/usb-lan-2.nmconnection" <<'EOF'
[connection]
id=usb-lan-2
type=ethernet
interface-name=eth2
autoconnect=false

[ipv4]
method=manual
address1=192.168.0.3/24
never-default=true

[ipv6]
method=disabled
EOF

chmod 600 "${ROOTFS_DIR}/etc/NetworkManager/system-connections/usb-lan-2.nmconnection"
