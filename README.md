# Raspberry Pi OS with Docker

This repository builds a customized Raspberry Pi OS
image using `pi-gen` and GitHub Actions.

## Features

- Raspberry Pi OS (Trixie)
- Docker Engine pre-installed
- Docker service enabled on boot
- X11 enabled (Wayland disabled)
- XRDP enabled for Remote Desktop access
- OpenSSH server enabled
- 1-Wire interface enabled
- Custom first-boot hostname configuration

## Default user

Username: `test`

The password is configured during the image build.

The user is a member of the `docker` group and can run Docker without `sudo`.

## First boot

On first boot the image looks for:

`/boot/firmware/hostname`

If the file exists, its contents are used as the system hostname, `/etc/hostname` and `/etc/hosts` are updated, and the file is removed so the change is only applied once.

## Remote access

SSH is enabled by default.

ssh test@<ip-address>

XRDP is enabled.

Connect using Microsoft's Remote Desktop
client to the Raspberry Pi's IP address and log
in with the same username and password.

## Building

The image is built automatically using GitHub Actions and `pi-gen-action`.

Customizations are implemented in the `custom-stage` directory.
