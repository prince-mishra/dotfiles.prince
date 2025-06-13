#!/bin/bash
# Simple lazygit installer

set -e

# Detect platform
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case $ARCH in
    x86_64) ARCH="x86_64" ;;
    arm64|aarch64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Get latest version
VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | cut -d'"' -f4 | sed 's/v//')

# Download and install
FILENAME="lazygit_${VERSION}_${OS}_${ARCH}.tar.gz"
URL="https://github.com/jesseduffield/lazygit/releases/download/v${VERSION}/${FILENAME}"

echo "Installing lazygit $VERSION..."

# Create install directory
mkdir -p ~/.local/bin

# Download, extract, and install
curl -L "$URL" | tar xz -C /tmp
mv /tmp/lazygit ~/.local/bin/

echo "✓ lazygit installed to ~/.local/bin/lazygit"
echo "Make sure ~/.local/bin is in your PATH"
