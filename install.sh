#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== Building niri (debug) ==="
cargo build

echo ""
echo "=== Building niri-touch-settings (debug) ==="
cd niri-touch-settings
cargo build
cd "$SCRIPT_DIR"

echo ""
echo "=== Stopping running instances ==="
killall niri-touch-settings 2>/dev/null && echo "Stopped niri-touch-settings." || echo "niri-touch-settings not running."

echo ""
echo "=== Installing ==="
sudo rm -f /usr/bin/niri /usr/local/bin/niri-touch-settings
sudo cp target/debug/niri /usr/bin/niri
sudo cp niri-touch-settings/target/debug/niri-touch-settings /usr/local/bin/niri-touch-settings

echo ""
echo "Done! Restart niri for compositor changes to take effect."
echo "Run 'niri-touch-settings' to open the settings app."
