#!/bin/bash
# netinfo uninstall script

echo "╔═══════════════════════════════════════╗"
echo "║  netinfo Uninstall Script             ║"
echo "╚═══════════════════════════════════════╝"
echo ""

# Check both system-wide and user installation locations
SYSTEM_PATH="/usr/local/bin/netinfo"
USER_PATH="$HOME/.local/bin/netinfo"

FOUND=0

# Check system-wide installation
if [ -f "$SYSTEM_PATH" ]; then
    echo "Found system-wide installation: $SYSTEM_PATH"
    if [ "$EUID" -eq 0 ]; then
        rm "$SYSTEM_PATH"
        echo "✓ Removed $SYSTEM_PATH"
        FOUND=1
    else
        echo "❌ Need root privileges to remove system-wide installation"
        echo "   Run: sudo $0"
        FOUND=1
    fi
fi

# Check user installation
if [ -f "$USER_PATH" ]; then
    echo "Found user installation: $USER_PATH"
    rm "$USER_PATH"
    echo "✓ Removed $USER_PATH"
    FOUND=1
fi

echo ""

if [ $FOUND -eq 1 ]; then
    echo "╔═══════════════════════════════════════╗"
    echo "║  Uninstall Complete! ✓                ║"
    echo "╚═══════════════════════════════════════╝"
else
    echo "No netinfo installation found"
fi

echo ""
