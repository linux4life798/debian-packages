# Ghidra Debian Package

This repository contains the packaging files needed to build a Debian package for Ghidra, a software reverse engineering (SRE) suite developed by NSA's Research Directorate.

- Launch Ghidra from your application menu
- Run `ghidra` from the command line
- Use `analyzeHeadless` for headless operations

## Building and Installing


```bash
sudo apt build-dep -y .
./get-ghidra.sh
dpkg-buildpackage -us -uc -b
```

```bash
sudo apt install -f ../ghidra_*_amd64.deb
```

Cleanup
```bash
dpkg-buildpackage -Tclean
```

## Package Details

- Ghidra files are installed to `/usr/share/ghidra/`
- Wrapper scripts are installed to `/usr/bin/`
- `launch.properties` is managed as `/etc/ghidra/launch.properties`
- Uses the distro default JDK at build time and the default JRE at runtime

## Maintaining and Upgrading

To update to a new version of Ghidra:

```bash
#sudo apt install git libxml2-utils

# Check upstream status.
uscan --report-status
# uscan --download

DEHS="$(uscan --dehs)"

LOCAL_VERSION="$(xmllint --xpath "string(//debian-uversion)" - <<<"$DEHS")"
LATEST_VERSION="$(xmllint --xpath "string(//upstream-version)" - <<<"$DEHS")"
LATEST_URL="$(xmllint --xpath "string(//upstream-url)" - <<<"$DEHS")"
LAST_TAG="ghidra-${LOCAL_VERSION%%-*}"

if [[ "${LATEST_VERSION}" != "${LOCAL_VERSION}" ]]; then
  echo "Using upstream release ${LATEST_URL}"
  dch -v "${LATEST_VERSION}" "New upstream release ${LATEST_VERSION}"
#   ./get-ghidra.sh

  mapfile -t lines < <(
    git log --format='%s' --no-merges "${LAST_TAG}..HEAD" -- . | sed 's/^ghidra: //g'
  )

  for line in "${lines[@]}"; do
    dch --append "$line"
  done

  dpkg-buildpackage -us -uc -b
else
  printf "Already at latest version: %s (%s)\n" "$LOCAL_VERSION" "$LATEST_URL"
fi

dch -r


git add debian/changelog
git commit -m""
git tag "ghidra-${LATEST_VERSION}"
```
