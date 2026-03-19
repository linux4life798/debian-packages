# Ghidra Debian Package

This repository contains the necessary files to build a Debian package for Ghidra, a software reverse engineering (SRE) suite developed by NSA's Research Directorate.

## Prerequisites

To build this package, you'll need:

- A Debian-based system (Debian, Ubuntu, etc.)
- Build dependencies: `build-essential`, `debhelper`, `devscripts`, `unzip`
- The Ghidra zip archive for the version you're packaging (downloaded automatically)

## Building the Package

1. Install build dependencies:

```bash
sudo apt-get update
sudo apt-get install build-essential debhelper devscripts unzip
```

2. Download the Ghidra archive:

```bash
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.4_build/ghidra_10.4_PUBLIC_20230928.zip
```

3. Build the package:

```bash
dpkg-buildpackage -us -uc -b
```

4. The resulting `.deb` file will be created in the parent directory.

## Installation

Install the package using:

```bash
sudo apt install -f ../ghidra_10.4-1_amd64.deb
```

## Usage

After installation, you can:

- Launch Ghidra from your application menu
- Run `ghidra` from the command line
- Use `analyzeHeadless` for headless operations

## Package Details

- Ghidra binaries are installed to `/usr/lib/ghidra/`
- Wrapper scripts are installed to `/usr/bin/`
- Uses OpenJDK 17 as a dependency

## Maintaining

To update to a new version of Ghidra:

1. Update the version and download URL in `debian/changelog`
2. Download the new Ghidra zip archive
3. Rebuild the package

## License

Ghidra is licensed under the Apache License, Version 2.0.
