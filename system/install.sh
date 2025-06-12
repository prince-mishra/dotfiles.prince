#!/bin/bash

# List of binaries and packages to check/install
binaries=(zsh git curl autojump wget vim)
packages=(fonts-powerline)

echo "Installing dependencies"
# Check and install missing binaries
for bin in "${binaries[@]}"; do
    if ! command -v "$bin" >/dev/null 2>&1; then
        echo "$bin not found, installing..."
        sudo apt install -y "$bin"
    else
        echo "$bin is already installed."
    fi
done

# Check and install non-binary package
for pkg in "${packages[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "$pkg not found, installing..."
        sudo apt install -y "$pkg"
    else
        echo "$pkg is already installed."
    fi
done
