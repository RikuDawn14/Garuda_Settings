# How to set up ProtonVPN
---
### 1) Install openVPN
  - `sudo pacman -S networkmanager-openvpn`
### 2) Get .ovpn
  - Log on to ProtonVPN from the website.
  - Go to Downloads => openVPN configuration files.
  - Download the .ovpn file you want.
### 3) Go to network settings
  - In "WI-FI & Networking" click on the "+"
  - Scroll to the bottom and choose "Import VPN Connection" then select the *.ovpn file.
  - Use the username and password given by ProtonVPN in the openVPN configuration files page.
  - Ensure network is set to auto connect to the VPN.
### 4) Restart the PC to start
  - After restarting you should see a pop up for vpn connection.
  - Check IP with "whatsmyip" or "ipchicken" to verify vpn connection.
