# netinfo

A modern network information tool for Linux that shows you everything about your network connection in a clean, easy-to-read format.

![Platform](https://img.shields.io/badge/platform-linux-blue) ![Python](https://img.shields.io/badge/python-3.6+-blue)

## What does it do?

`netinfo` shows you detailed information about your network connections, WiFi, devices on your network, open ports, DNS settings, and more. 
## Screenshot



## Features

- **Network interfaces** - See all your network connections (WiFi, Ethernet, VPN, etc.)
- **Connected devices** - Find out what devices are on your network
- **WiFi information** - Shows your WiFi network name and signal
- **Open ports** - See what services are running on your computer
- **DNS settings** - Check your DNS servers and test them
- **Routing table** - View how your network traffic is routed
- **Public IP info** - See your public IP, ISP, and location
- **Security checks** - VPN status, firewall status, DNS leak detection
- **Color-coded output** - Easy to read with meaningful colors
- **Export to JSON** - Save all network info for later

## Installation

### Quick Install

```bash
# Download the script
curl -O https://raw.githubusercontent.com/yourusername/netinfo/main/netinfo
chmod +x netinfo

# Move it to your system path
sudo mv netinfo /usr/local/bin/

# Done! Now just run:
netinfo
```

### From Source

```bash
git clone https://github.com/yourusername/netinfo.git
cd netinfo
chmod +x netinfo
sudo cp netinfo /usr/local/bin/
```

## Usage

### Basic Commands

Show your network interfaces (default view):
```bash
netinfo
```

Show everything (full network information):
```bash
netinfo all
```

Show devices on your network:
```bash
netinfo all
# Devices are listed in the "Local Network Devices" section
```

Show routing table:
```bash
netinfo routes
```

Show open ports:
```bash
netinfo ports
```

Test DNS and check for leaks:
```bash
netinfo dns
```

Export everything to JSON:
```bash
netinfo json
netinfo json -o mynetwork.json
```

### Options

Include IPv6 addresses:
```bash
netinfo all --ipv6
```

Show only active (UP) interfaces:
```bash
netinfo all --active
```

Disable colors (for scripts):
```bash
netinfo --no-color
```

## What you'll see

### Network Interfaces
Shows all your network connections with:
- **Name** - Friendly name (WiFi, Ethernet, etc.)
- **Device** - Technical name (wlan0, eth0, etc.)
- **Status** - Whether it's UP (connected) or DOWN
- **IP Address** - Your local IP address
- **WiFi Network** - Name of connected WiFi (if applicable)
- **Speed** - Connection speed (in full view)
- **MAC Address** - Hardware address

### Local Network Devices
Lists all devices connected to your network:
- **Gateway Router** - Your router with admin page link
- **Mobile devices** - Phones and tablets (shows hostname if available)
- **Computers** - Other computers on the network
- **This Device** - Your own computer

Devices with "Private MAC" are using privacy features (common on phones).

### Network Information
- Public IP address
- Internet provider (ISP)
- Location (city and country)
- DNS servers

### Security Status
- VPN connection status
- Proxy configuration
- Firewall status

### Open Ports
Shows which network services are running on your computer (SSH, web servers, etc.)

### DNS Tests
- Tests if DNS is working properly
- Checks for DNS leaks (if using VPN)
- Shows response times

## Requirements

- Linux operating system
- Python 3.6 or newer

That's it! Everything else is built-in.

### Optional Tools

For WiFi network names, install:
```bash
sudo apt install wireless-tools  # Ubuntu/Debian
sudo dnf install wireless-tools  # Fedora
sudo pacman -S wireless_tools    # Arch Linux
```

## Tips

**Finding devices on your network:** Run `netinfo all` and scroll to the "Local Network Devices" section.

**Accessing your router:** Look for "Gateway Router (Admin: http://...)" in the device list and use that URL.

**Checking VPN connection:** Run `netinfo all` and look at the "Security & Connectivity" section.

**Troubleshooting DNS:** Run `netinfo dns` to test your DNS servers.

**Getting device hostnames:** If devices show as "Mobile Device (Private MAC)", they're using privacy protection. You can disable this in your phone's WiFi settings (tap your network → Privacy → Use device MAC).

## Understanding the Output

**Colors:**
- 🟢 Green - Active/Good
- 🔴 Red - Inactive/Problem
- 🟡 Yellow - Warning/Unknown
- 🔵 Blue - Information

**Status meanings:**
- **UP** - Interface is active and connected
- **DOWN** - Interface is not connected
- **UNKNOWN** - Status cannot be determined

**Private MAC:** Your phone is using a privacy feature that hides its real hardware address. This is good for security but makes device identification harder.

## Troubleshooting

**No devices showing up?**
- Wait a few seconds and run the command again (it scans the network)
- Make sure devices are actually connected to your WiFi
- Some devices may not respond to network scans

**"Permission denied" errors?**
Try running with sudo:
```bash
sudo netinfo all
```

**WiFi name not showing?**
Install wireless-tools (see Requirements section above)

## Contributing

Found a bug or have an idea? Feel free to open an issue or submit a pull request!

## License

MIT License - Free to use and modify

## Version

Current version: 1.0.0

---

Made for people who want to understand their network without reading a manual 📡
