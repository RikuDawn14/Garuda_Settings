#!/bin/bash
sudo pacman -S --needed qemu-full libvirt virt-manager dnsmasq edk2-ovmf iptables-nft
sudo systemctl enable --now libvirtd.service
sudo usermod -aG libvirt,kvm $USER
lscpu | grep -i virtualization
lsmod | grep kvm
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all
sudo systemctl enable virtlogd.socket
sudo systemctl enable virtlockd.socket
