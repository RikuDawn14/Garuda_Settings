#!/bin/bash
sudo pacman -S qemu-full libvirt virt-manager dnsmasq bridge-utils edk2-ovmf iptables-nft
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo systemctl status libvirtd.service
sudo usermod -aG libvirt,kvm rikudawn
reboot
lscpu | grep virtualization
lscpu | grep Virtualization
lsmod | grep kvm
sudo virsh net-start default
sudo virsh net-autostart default
sudo virsh net-list --all
