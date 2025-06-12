#!/bin/bash

# Check if 'cargo' is available
if ! command -v cargo &> /dev/null; then
  echo "Cargo not found. Installing Rust and Cargo using rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  export PATH="$HOME/.cargo/bin:$PATH"
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc  # Or ~/.zshrc
else
  echo "Cargo is already installed: $(cargo --version)"
fi


cargo install cargo-binstall
cargo binstall exa bat ripgrep fd-find
