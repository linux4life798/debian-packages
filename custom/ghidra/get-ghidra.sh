#!/bin/bash
# Script to download Ghidra for building the Debian package
# Default version is 10.4, but can be changed by passing a parameter

VERSION=${1:-10.4}
RELEASE_DATE=${2:-20230928}

echo "Downloading Ghidra ${VERSION} (build date: ${RELEASE_DATE})..."
wget -c "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${VERSION}_build/ghidra_${VERSION}_PUBLIC_${RELEASE_DATE}.zip"

if [ $? -eq 0 ]; then
    echo "Download complete: ghidra_${VERSION}_PUBLIC_${RELEASE_DATE}.zip"
else
    echo "Download failed. Please check the version and release date."
    exit 1
fi
