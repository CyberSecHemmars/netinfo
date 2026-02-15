#!/bin/bash
# netinfo installation script

set -e

echo "╔═══════════════════════════════════════╗"
echo "║  netinfo Installation Script          ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    echo "Please install Python 3.6 or higher first"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2 | cut -d'.' -f1-2)
echo "✓ Python $PYTHON_VERSION found"

# Check if running as root for system-wide install
if [ "$EUID" -eq 0 ]; then
    INSTALL_PATH="/usr/local/bin/netinfo"
    echo "✓ Installing system-wide to $INSTALL_PATH"
else
    # User install
    mkdir -p "$HOME/.local/bin"
    INSTALL_PATH="$HOME/.local/bin/netinfo"
    echo "✓ Installing for current user to $INSTALL_PATH"
    
    # Check if ~/.local/bin is in PATH
    if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
        echo ""
        echo "⚠️  Warning: $HOME/.local/bin is not in your PATH"
        echo "Add this line to your ~/.bashrc or ~/.zshrc:"
        echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
        echo "    source ~/.zshrc"
    fi
fi

# Copy the script
cp netinfo "$INSTALL_PATH"
chmod +x "$INSTALL_PATH"

echo "✓ netinfo installed successfully!"
echo ""

# Check for optional dependencies
echo "Checking optional dependencies..."

if command -v iwconfig &> /dev/null || command -v iwgetid &> /dev/null; then
    echo "✓ Wireless tools found (WiFi SSID detection available)"
else
    echo "⚠️  Wireless tools not found (WiFi SSID detection unavailable)"
    echo "   Install with: sudo apt install wireless-tools"
fi

echo ""
echo "╔═══════════════════════════════════════╗"
echo "║  Installation Complete! 🎉            ║"
echo "╚═══════════════════════════════════════╝"
echo ""
echo "Run 'netinfo' to get started"
echo "Run 'netinfo --help' for more options"
echo ""
