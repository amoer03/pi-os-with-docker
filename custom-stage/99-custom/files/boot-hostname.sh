#!/bin/bash -e

FILE=/boot/firmware/hostname

NAME="$(tr -d '\r\n ' < "$FILE")"

if [ -z "$NAME" ]; then
  exit 0
fi

hostnamectl set-hostname "$NAME"
echo "$NAME" > /etc/hostname

if grep -q '^127\.0\.1\.1' /etc/hosts; then
  sed -i "s/^127\.0\.1\.1.*/127.0.1.1	$NAME/" /etc/hosts
else
  echo "127.0.1.1	$NAME" >> /etc/hosts
fi

rm -f "$FILE"

