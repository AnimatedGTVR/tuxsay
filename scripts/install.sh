#!/usr/bin/env bash

set -e

INSTALL_DIR="/usr/local/bin"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

TUXSAY_SOURCE="$SCRIPT_DIR/scripts/tuxsay.sh"
TUXRIVAL_SOURCE="$SCRIPT_DIR/scripts/tuxrival.sh"

if [ ! -f "$TUXSAY_SOURCE" ]; then
  echo "Missing scripts/tuxsay.sh"
  exit 1
fi

if [ ! -f "$TUXRIVAL_SOURCE" ]; then
  echo "Missing scripts/tuxrival.sh"
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
echo "tuxsay installed successfully."
echo
echo "Try:"
echo "  tuxsay"
echo "  tuxsay lolcat \"rainbow penguin mode\""
echo "  tuxrival"
