#!/bin/bash -e

USER="${FIRST_USER_NAME}"
HOME_DIR="/home/${USER}"
BOOT_KEY="/boot/ssh_id.pub"
SSH_DIR="${HOME_DIR}/.ssh"
AUTH_KEYS="${SSH_DIR}/authorized_keys"

echo "[firstboot] Checking for SSH key..."

if [ -f "$BOOT_KEY" ]; then
    echo "[firstboot] Found key, installing for $USER"

    install -d -m 700 "$SSH_DIR"
    cat "$BOOT_KEY" >> "$AUTH_KEYS"

    chown -R "$USER:$USER" "$SSH_DIR"
    chmod 700 "$SSH_DIR"
    chmod 600 "$AUTH_KEYS"

    echo "[firstboot] SSH key installed"
else
    echo "[firstboot] No key found, skipping"
fi

# disable service after first run
systemctl disable install-ssh-key.service
rm -f /etc/systemd/system/install-ssh-key.service

exit 0

