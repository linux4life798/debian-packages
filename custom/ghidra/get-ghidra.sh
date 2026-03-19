#!/bin/bash
# Download the Ghidra archive for the package version in debian/changelog.
# Usage:
#   ./get-ghidra.sh           # download changelog version
#   ./get-ghidra.sh latest    # download latest upstream version
#   ./get-ghidra.sh 12.0.4    # download a specific version

set -euo pipefail

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"

cd "${SCRIPT_DIR}"

case "${1:-}" in
  "")
    uscan --download-current-version
    ;;
  latest)
    uscan --download
    ;;
  *)
    uscan --download-version "$1"
    ;;
esac
