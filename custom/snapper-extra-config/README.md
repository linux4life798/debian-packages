# snapper-extra-config

Extra snapshot hooks for Snapper.

- `/lib/systemd/system/snapper-boot@.service` — oneshot unit to create a
  snapshot for additional configurations on boot
  - Enable for a specific config (example: "home"):

    ```bash
    sudo systemctl enable --now snapper-boot@home.service
    ```
- `/etc/apt/apt.conf.d/80snapper-boot` — APT hook for pre/post snapshots of
  the "boot" config (if present)
  - This mimics the existing
    https://salsa.debian.org/debian/snapper/-/blob/debian/sid/debian/80snapper
    that snapshots the "root" config pre/post an APT operation. This is
    helpful if you have a "boot" config that should be preserved pre/post
    APT as well.
