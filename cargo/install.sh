#!/bin/bash

# Check if 'cargo' is available
if ! command -v cargo &> /dev/null; then
  echo "Cargo not found. Installing Rust and Cargo using rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  cargo install cargo-binstall
else
  echo "Cargo is already installed: $(cargo --version)"
fi

binaries=(exa bat ripgrep fd-find just)

echo "Installing rust CLIs"
# Check and install missing binaries
for bin in "${binaries[@]}"; do
    if ! command -v "$bin" >/dev/null 2>&1; then
        echo "$bin not found, installing..."
        cargo binstall "$bin"
    else
        echo "$bin is already installed."
    fi
done

