# Custom Debian Packages Staged for Upstreaming

## Build Package

```bash
# Install build dependencies (packages needed to build this package).
# You can build this in a docker container, if you don't like the idea of
# polluting you manually installed package list.
sudo apt build-dep .

# Build the package.
dpkg-buildpackage -b --no-sign
```

## Update Changelog

* Create new - `debchange --create`
* Update timestamp - `debchange -r`
* Increment revision - `debchange -i` and then run `debchange -r` when you are
  ready to actually release it.

# Debian Tools

* Source Browser - https://sources.debian.org
* CodeSearch - https://codesearch.debian.net

  Example: https://codesearch.debian.net/search?q=--buildsystem%3Dgradle
* Packages Search - https://packages.debian.org
* Packages Git - http://salsa.debian.org


## References

* https://github.com/psanford/tpm-fido/pull/35
