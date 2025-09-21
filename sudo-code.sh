#!/bin/bash
# sudo-code: Open a root-owned file in VS Code and save safely with sudo

FILE="$1"

if [ -z "$FILE" ]; then
    echo "Usage: sudo-code /path/to/file"
    exit 1
fi

if ! command -v code &> /dev/null; then
    echo "VS Code CLI 'code' not found. Open VS Code and connect via Remote SSH first."
    exit 1
fi

# Create temporary editable copy
TMPFILE="/home/ubuntu/.sudo_code_tmp_$(basename "$FILE")"
sudo cp "$FILE" "$TMPFILE"
sudo chown ubuntu:ubuntu "$TMPFILE"

# Open temp file in VS Code
code "$TMPFILE"

# Wait for user to confirm changes are done
read -p "Press ENTER to save with sudo..."

# Save changes back to original file
sudo cp "$TMPFILE" "$FILE"

# Remove temp file
rm "$TMPFILE"

echo "Saved '$FILE' and removed temporary file."
