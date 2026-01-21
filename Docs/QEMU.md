# QEMU/KVM Virtualization Setup Guide

This code sets up a complete virtualization environment on an Arch Linux system using QEMU/KVM and libvirt.

## Package Installation

```bash
sudo pacman -S qemu-full libvirt virt-manager dnsmasq bridge-utils edk2-ovmf iptables-nft
```

Installs the core virtualization packages:

- **qemu-full** - Complete QEMU emulator package for running virtual machines
- **libvirt** - Virtualization API and management daemon that provides a unified interface for managing VMs
- **virt-manager** - Graphical desktop application for managing virtual machines
- **dnsmasq** - Lightweight DNS/DHCP server used for VM networking
- **bridge-utils** - Utilities for configuring network bridges that connect VMs to the network
- **edk2-ovmf** - UEFI firmware for virtual machines (enables booting VMs with UEFI instead of legacy BIOS)
- **iptables-nft** - Firewall tools needed for VM network isolation and NAT

## Service Management

```bash
sudo systemctl enable libvirtd.service
```
Configures the libvirt daemon to start automatically at boot.

```bash
sudo systemctl start libvirtd.service
```
Starts the libvirt daemon immediately.

```bash
sudo systemctl status libvirtd.service
```
Checks whether the libvirt service is running properly and displays its current status.

## User Permissions

```bash
sudo usermod -aG libvirt,kvm $(whoami)
```
Adds the current user to the `libvirt` and `kvm` groups, granting permission to manage virtual machines without requiring sudo for every operation. The `$(whoami)` command automatically inserts your current username.

```bash
reboot
```
Restarts the system to apply group membership changes (required for the usermod changes to take effect).

## Verification Commands

```bash
lscpu | grep Virtualization
```
Checks CPU virtualization capabilities. These commands look for hardware virtualization support (Intel VT-x or AMD-V).

```bash
lsmod | grep kvm
```
Verifies that the KVM kernel modules are loaded. You should see `kvm_intel` or `kvm_amd` depending on your processor.

## Network Configuration

```bash
sudo virsh net-start default
```
Starts the default virtual network immediately. This creates a virtual network that VMs can use to communicate with each other and access the host's network.

```bash
sudo virsh net-autostart default
```
Configures the default network to start automatically when libvirtd starts.

```bash
sudo virsh net-list --all
```
Lists all virtual networks (both active and inactive) to confirm the default network is configured and running.

---
