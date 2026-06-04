#!/usr/bin/env bash

set -e

PROJECT_NAME="tuxsay"
INSTALL_DIR="/usr/local/bin"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TUXSAY_SOURCE="$SCRIPT_DIR/scripts/tuxsay"
TUXRIVAL_SOURCE="$SCRIPT_DIR/scripts/tuxrival"

if [ ! -f "$TUXSAY_SOURCE" ]; then
  echo "Missing scripts/tuxsay"
  exit 1
fi

if [ ! -f "$TUXRIVAL_SOURCE" ]; then
  echo "Missing scripts/tuxrival"
  exit 1
fi

chmod +x "$TUXSAY_SOURCE"
chmod +x "$TUXRIVAL_SOURCE"

echo "Installing tuxsay..."
sudo cp "$TUXSAY_SOURCE" "$INSTALL_DIR/tuxsay"

echo "Installing tuxrival..."
sudo cp "$TUXRIVAL_SOURCE" "$INSTALL_DIR/tuxrival"

sudo chmod +x "$INSTALL_DIR/tuxsay"
sudo chmod +x "$INSTALL_DIR/tuxrival"

echo
echo "Installed successfully."
echo
echo "Try:"
echo "  tuxsay"
echo "  tuxsay lolcat \"rainbow penguin mode\""
echo "  tuxrival"
