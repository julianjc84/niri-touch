#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== Building niri-touch-settings (debug) ==="
cd niri-touch-settings
cargo build
cd "$SCRIPT_DIR"

echo ""
echo "=== Stopping running instance ==="
killall niri-touch-settings 2>/dev/null && echo "Stopped." || echo "Not running."

echo ""
echo "=== Installing niri-touch-settings ==="
sudo cp niri-touch-settings/target/debug/niri-touch-settings /usr/local/bin/niri-touch-settings

echo ""
echo "Done! Run 'niri-touch-settings' to open the settings app."
