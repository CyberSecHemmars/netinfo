# netinfo - Feature Summary

## What Changed from Original Script

### 1. **Name Change**
- **Old**: `ifconfig` (conflicts with system command)
- **New**: `netinfo` (unique and descriptive)

### 2. **Header Color**
- **Old**: Purple/Magenta
- **New**: Cyan (cleaner, more professional look)

### 3. **Interface Names**
- **Old**: Technical names only (wlan0, enp3s0, etc.)
- **New**: Friendly names + technical names
  - "WiFi" instead of just "wlan0"
  - "Ethernet" instead of just "enp3s0"
  - Shows both: "WiFi" in white, "wlan0" in gray

### 4. **New Features Added**

#### MAC Address Column
- Shows hardware address for each interface
- Displayed in cyan color
- Useful for network troubleshooting and device identification

#### WiFi SSID Column
- Automatically detects and displays connected WiFi network name
- Only appears when at least one WiFi interface is present
- Shown in yellow color
- Uses `iwgetid` or `iwconfig` when available

#### IPv6 Support (Optional)
- Add `--ipv6` or `-6` flag to display IPv6 addresses
- Keeps table clean by default (IPv6 off)
- Shows IPv6 with CIDR notation when enabled

#### Command-Line Arguments
- `--help` / `-h`: Show help and usage examples
- `--version` / `-v`: Display version number
- `--no-color`: Disable colors (useful for scripts/logs)
- `--ipv6` / `-6`: Include IPv6 addresses

### 5. **Better Column Organization**

**Default view:**
```
NAME           DEVICE   MAC ADDRESS        SSID        STATUS  IPv4 ADDRESS    
```

**With --ipv6:**
```
NAME           DEVICE   MAC ADDRESS        SSID        STATUS  IPv4 ADDRESS      IPv6 ADDRESS
```

### 6. **Smart Features**

#### Dynamic Column Width
- Automatically adjusts to fit content
- No wasted space or truncated data

#### Conditional SSID Column
- Only shows SSID column when WiFi interfaces exist
- Keeps table clean for servers without WiFi

#### Improved Sorting
- Still sorts by status (UP first, DOWN last)
- More reliable status detection

### 7. **Professional Additions**

#### Better Error Handling
- Graceful fallback when commands aren't available
- Clear error messages
- Demo data for testing environments

#### Documentation
- Comprehensive README with examples
- Installation instructions
- Troubleshooting guide
- Comparison with other tools

#### GitHub Ready
- LICENSE (MIT)
- CONTRIBUTING.md
- .gitignore
- Installation script

## Color Scheme

| Element          | Color  | Purpose                          |
|------------------|--------|----------------------------------|
| Headers          | Cyan   | Column titles and separator      |
| Interface Name   | White  | Friendly name (primary info)     |
| Device Name      | Gray   | Technical name (secondary info)  |
| MAC Address      | Cyan   | Hardware address                 |
| SSID             | Yellow | WiFi network name                |
| Status UP        | Green  | Interface is online              |
| Status DOWN      | Red    | Interface is offline             |
| Status UNKNOWN   | Yellow | Status unclear                   |
| IP Addresses     | Blue   | IPv4 and IPv6 addresses          |

## Usage Examples

### Basic usage
```bash
netinfo
```

### Include IPv6
```bash
netinfo --ipv6
```

### No colors (for logging/scripts)
```bash
netinfo --no-color > network-status.txt
```

### Get help
```bash
netinfo --help
```

## What's Missing (Intentionally)

These features were considered but not included to keep it clean:

- ❌ RX/TX statistics (would make table too wide)
- ❌ Link speed (not always available/reliable)
- ❌ Gateway info (can be added in future version)
- ❌ DNS servers (scope creep)
- ❌ Watch/monitor mode (would need different UI)

## Installation Methods

### Method 1: Quick install script
```bash
chmod +x install.sh
./install.sh
```

### Method 2: Manual install
```bash
chmod +x netinfo
sudo cp netinfo /usr/local/bin/
```

### Method 3: User install
```bash
mkdir -p ~/.local/bin
cp netinfo ~/.local/bin/
# Add ~/.local/bin to PATH
```

## System Requirements

- **Python 3.6+** (no external dependencies)
- **Linux** with /sys/class/net/
- **Optional**: wireless-tools (for SSID detection)

## Compatibility

Tested and works on:
- ✅ Ubuntu/Debian
- ✅ Fedora/RHEL
- ✅ Arch Linux
- ✅ Any modern Linux with /sys/class/net/

Does NOT work on:
- ❌ macOS (different network stack)
- ❌ Windows (different network stack)
- ❌ BSD systems (different /sys structure)

## Future Enhancement Ideas

Want to contribute? Consider adding:
- Network speed/bandwidth monitoring
- Gateway and DNS information
- Export to JSON/CSV
- Watch mode for live updates
- Filter by interface type
- Connection quality metrics
