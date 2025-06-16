#!/bin/bash

set -e

# Configuration
GO_OS="linux"
GO_ARCH="amd64"

# Detect OS
case "$(uname -s)" in
    Darwin*) GO_OS="darwin" ;;
    Linux*)  GO_OS="linux" ;;
    CYGWIN*|MINGW*|MSYS*) GO_OS="windows" ;;
esac

# Detect architecture
case "$(uname -m)" in
    x86_64) GO_ARCH="amd64" ;;
    arm64|aarch64) GO_ARCH="arm64" ;;
    armv6l) GO_ARCH="armv6l" ;;
    armv7l) GO_ARCH="armv7l" ;;
    i386) GO_ARCH="386" ;;
esac

echo "Detecting latest Go version..."

# Get latest Go version from official API
GO_VERSION=$(curl -s "https://go.dev/VERSION?m=text" | head -n1)

if [ -z "$GO_VERSION" ]; then
    echo "Failed to detect latest Go version. Falling back to manual check..."
    GO_VERSION=$(curl -s "https://golang.org/dl/?mode=json" | grep -o '"version":"[^"]*' | head -n1 | cut -d'"' -f4)
fi

if [ -z "$GO_VERSION" ]; then
    echo "Error: Could not determine latest Go version"
    exit 1
fi

# Remove 'go' prefix if present
GO_VERSION=${GO_VERSION#go}

GO_TARBALL="go${GO_VERSION}.${GO_OS}-${GO_ARCH}.tar.gz"
GO_URL="https://golang.org/dl/${GO_TARBALL}"

echo "Latest Go version: ${GO_VERSION}"
echo "Installing Go ${GO_VERSION} for ${GO_OS}/${GO_ARCH}..."

# Create ~/.local directory structure
LOCAL_BIN="$HOME/.local/bin"
mkdir -p $LOCAL_BIN

# Installation directories
INSTALL_DIR="${LOCAL_BIN}/go-${GO_VERSION}"
GO_SYMLINK="${LOCAL_BIN}/go"

# Check if Go is already installed
if command -v go >/dev/null 2>&1; then
    CURRENT_VERSION=$(go version | awk '{print $3}' | sed 's/go//')
    echo "Current Go version: ${CURRENT_VERSION}"
    
    if [ "$CURRENT_VERSION" = "$GO_VERSION" ]; then
        echo "Latest Go version is already installed!"
        exit 0
    fi
    
    echo "Newer version available, continuing with installation..."
fi

if [ -d "$INSTALL_DIR" ]; then
    echo "Go ${GO_VERSION} is already installed at ${INSTALL_DIR}"
    echo "Updating symlink..."
else
    # Download and install Go
    echo "Downloading ${GO_URL}..."
    TMPDIR=$(mktemp -d)
    trap 'rm -rf "$TMPDIR"' EXIT
    curl -L "${GO_URL}" -o "${TMPDIR}/${GO_TARBALL}"

    echo "Installing Go to ${INSTALL_DIR}..."
    mkdir -p "$INSTALL_DIR"
    tar -C "$INSTALL_DIR" --strip-components=1 -xzf "/${TMPDIR}/${GO_TARBALL}"

fi

# Create or update symlink to latest version
echo "Creating symlink -> ${INSTALL_DIR}..."
ln -sfn "$INSTALL_DIR" "$GO_SYMLINK"

if command -v ${GO_SYMLINK}/bin/go >/dev/null 2>&1; then
    echo "Go symlink updated to point to ${GO_SYMLINK}"
else
    echo "Failed to create symlink for Go"
    exit 1
fi