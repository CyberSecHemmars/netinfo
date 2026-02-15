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

### Method 1: Using the Installer (Recommended)

```bash
# Clone the repository
git clone https://github.com/CyberSecHemmars/netinfo.git
cd netinfo

# Run the installer
chmod +x install.sh
sudo ./install.sh       # System-wide install
# OR
./install.sh            # User install (no sudo needed)
```

### Method 2: Quick Manual Install

```bash
# Download the script
curl -O https://raw.githubusercontent.com/CyberSecHemmars/netinfo/main/netinfo
chmod +x netinfo

# Move it to your system path
sudo mv netinfo /usr/local/bin/

# Done! Now just run:
netinfo
```

### Method 3: From Source

```bash
git clone https://github.com/CyberSecHemmars/netinfo.git
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

Current version: 2.0.0

---

Made for people who want to understand their network without reading a manual 📡
