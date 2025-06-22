#!/bin/bash

# File Integrity Checker (SHA-256)
# Usage: ./file-inte-checker.sh /path/to/file

file_path="$1"

# Validate input
if [ ! -f "$file_path" ]; then
    echo "Error: File '$file_path' does not exist."
    exit 1
fi

# Generate or verify checksum
if [ ! -f "${file_path}.sha256" ]; then
    echo "Creating baseline checksum..."
    sha256sum "$file_path" > "${file_path}.sha256"
    echo "Baseline created: $(cat "${file_path}.sha256")"
else
    echo "Verifying file integrity..."
    sha256sum -c "${file_path}.sha256" 2>/dev/null && \
        echo "File integrity intact." || \
        echo "WARNING: File integrity check failed!"
fi
