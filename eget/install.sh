#!/usr/bin/env bash

set -euxo pipefail


function check_and_install_eget() {
    # Check if eget is already installed
    if command -v eget &> /dev/null; then
        echo "eget is already installed."
        return 0
    fi
        
    # Simple script to install eget
    INSTALL_DIR="${HOME}/.local/bin"
    REPO="zyedidia/eget"
    TMPDIR=$(mktemp -d)

    # Create install directory
    mkdir -p "$INSTALL_DIR"

    # Detect platform
    OS=$(uname -s | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)

    case $ARCH in
        x86_64) ARCH="amd64" ;;
        aarch64) ARCH="arm64" ;;
        armv7l) ARCH="arm" ;;
    esac

    # Get latest version and remove 'v' prefix
    VERSION=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"tag_name": "v?([^"]+)".*/\1/')

    # Download and install
    FILENAME="eget-${VERSION}-${OS}_${ARCH}.tar.gz"
    URL="https://github.com/${REPO}/releases/download/v${VERSION}/${FILENAME}"

    echo "Downloading eget ${VERSION} for ${OS}_${ARCH}..."

    # Download to temp file first, then extract
    pushd "${TMPDIR}"
        curl -L "$URL" -o "${FILENAME}"
        tar -xzf "${FILENAME}"

        # Find and move the eget binary
        find . -name "eget" -type f -exec mv {} "$INSTALL_DIR/eget" \;

    popd

    # Cleanup
    rm -rf "${TMPDIR}"

    chmod +x "$INSTALL_DIR/eget"

    echo "eget installed to $INSTALL_DIR/eget"
    echo "Make sure $INSTALL_DIR is in your PATH"

    # Verify installation
    "$INSTALL_DIR/eget" --version

}

function install_tools() {
    # Check if eget is installed
    if ! command -v eget &> /dev/null; then
        echo "eget is not installed. Please install it first."
        return 1
    fi

    # List of tools to install
    local tools=(
        eza-community/eza
        ajeetdsouza/zoxide
        dandavison/delta
        stedolan/jq
    )

    # Install each tool using eget
    for tool in "${tools[@]}"; do
        echo "Installing $tool..."
        if eget "$tool"; then
            echo "✅ Successfully installed $tool"
        else
            echo "❌ Failed to install $tool"
        fi
    done

    echo "All tools installed successfully!"
}

check_and_install_eget
install_tools