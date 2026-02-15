# netinfo

A clean, colorful network interface information tool for Linux. A modern alternative to `ifconfig` with better readability and useful features.

![netinfo demo](https://img.shields.io/badge/platform-linux-blue) ![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue)

## Features

✨ **Clean tabular output** - Easy to read interface information at a glance  
🎨 **Color-coded status** - Green (UP), Red (DOWN), Yellow (UNKNOWN)  
📶 **WiFi SSID display** - Shows connected WiFi network names  
🔌 **MAC addresses** - Hardware addresses for all interfaces  
🌐 **IPv6 support** - Optional IPv6 address display with `--ipv6` flag  
📊 **Smart sorting** - Online interfaces appear first, offline interfaces below  
🔧 **Friendly interface names** - "WiFi", "Ethernet" instead of cryptic "wlp3s0"  
⚡ **Fast and lightweight** - No external dependencies, pure Python  
🎯 **Multiple interface types** - Detects loopback, ethernet, wifi, bridge, VPN, virtual, etc.

## Screenshot

<img width="1006" height="360" alt="Screenshot_20260215_142739" src="https://github.com/user-attachments/assets/5af1aec3-a655-45d9-8402-15142ef0fc47" />


## Installation

### Quick Install [Recommended]

```bash
# Download the script
curl -O https://raw.githubusercontent.com/CyberSecHemmars/netinfo/main/netinfo
chmod +x netinfo

# Move to system path
sudo mv netinfo /usr/local/bin/

# Run
netinfo
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/CyberSecHemmars/netinfo.git
cd netinfo

# Make executable
chmod +x netinfo

# Copy to system path
sudo cp netinfo /usr/local/bin/
```

### Create an Alias [Optional]

If you prefer to keep it in your home directory or want to use a custom name:

```bash
# Add to ~/.bashrc or ~/.zshrc
alias ni='/path/to/netinfo'
alias ifconfig='/path/to/netinfo'  # Replace system ifconfig
```

## Usage

### Basic Usage

```bash
netinfo
```

### With IPv6 Addresses

```bash
netinfo --ipv6
# or
netinfo -6
```

### Without Colors (for scripts/piping)

```bash
netinfo --no-color
```

### Show Help

```bash
netinfo --help
```

### Show Version

```bash
netinfo --version
```

## Output Columns

| Column       | Description                                    |
|--------------|------------------------------------------------|
| NAME         | Friendly interface name (WiFi, Ethernet, etc.) |
| DEVICE       | Technical device name (wlan0, eth0, etc.)      |
| MAC ADDRESS  | Hardware (MAC) address                         |
| SSID         | WiFi network name (only for WiFi interfaces)   |
| STATUS       | UP (green), DOWN (red), or UNKNOWN (yellow)    |
| IPv4 ADDRESS | IP address with CIDR notation                  |
| IPv6 ADDRESS | IPv6 address (shown with --ipv6 flag)          |

## Requirements

- **Python 3.6+**
- **Linux** with `/sys/class/net/` (most modern distributions)
- **Optional**: `iwconfig` or `iwgetid` for WiFi SSID detection

### Checking Requirements

```bash
# Check Python version
python3 --version

# Check if wireless tools are installed (for SSID)
which iwconfig
which iwgetid

# If not installed:
sudo apt install wireless-tools  # Debian/Ubuntu
sudo dnf install wireless-tools  # Fedora
sudo pacman -S wireless_tools    # Arch
```

## How It Works

`netinfo` reads network interface information directly from:
- `/sys/class/net/` - Interface names and operational state
- Socket `ioctl` calls - IP addresses and netmasks
- `/sys/class/net/*/address` - MAC addresses
- `/proc/net/if_inet6` - IPv6 addresses (when enabled)
- `iwgetid`/`iwconfig` - WiFi SSIDs (optional)

This approach is fast, efficient, and doesn't require parsing command output or running multiple system utilities.

## Color Scheme

The tool uses a carefully chosen color palette for readability:

- **Cyan (Header)** - Column headers and separator
- **White** - Interface friendly names
- **Gray** - Technical device names
- **Cyan** - MAC addresses
- **Yellow** - WiFi SSIDs
- **Green** - UP status
- **Red** - DOWN status
- **Blue** - IP addresses

## Supported Interface Types

`netinfo` automatically detects and labels these interface types:

| Type       | Prefixes                          | Display Name    |
|------------|-----------------------------------|-----------------|
| Loopback   | `lo`                              | Loopback        |
| Ethernet   | `eth`, `enp`, `eno`, `ens`        | Ethernet [#]    |
| WiFi       | `wlan`, `wlp`, `wlo`              | WiFi [#]        |
| Bridge     | `docker`, `br-`                   | Bridge/Docker   |
| VPN        | `tun`, `tap`                      | VPN Tunnel/TAP  |
| Virtual    | `veth`                            | Virtual Ethernet|

## Troubleshooting

### SSID not showing for WiFi

Make sure `iwconfig` or `iwgetid` is installed:
```bash
sudo apt install wireless-tools
```

### Permission denied errors

Some operations may require elevated privileges:
```bash
sudo netinfo
```

### No interfaces showing

Check if `/sys/class/net/` exists:
```bash
ls /sys/class/net/
```

If it doesn't exist, your system may not be compatible.

## Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## License

MIT License - feel free to use this tool in your projects!

## Author

Created with ❤️ for the Linux community

## Changelog

### v1.0.0 (2026-02-15)
- Initial release
- Basic interface information display
- Color-coded output
- WiFi SSID detection
- MAC address display
- IPv6 support with flag
- Friendly interface names
- Smart status-based sorting

## Future Features

Ideas for future versions:

- [ ] Network speed/bandwidth display
- [ ] RX/TX packet statistics
- [ ] Gateway information
- [ ] DNS server display
- [ ] JSON output format for scripting
- [ ] Watch mode (continuous updates)
- [ ] Filter by interface type
- [ ] Export to CSV/JSON

---

**Star this repo if you find it useful!** ⭐
