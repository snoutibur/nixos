This Nix configuration uses an external hardware config file due to its nature for being machine-specific and containing somewhat personal information.

Run `./hwcsetup.sh` to automatically create a flake in `/etc/nixos/` that serves as the wrapper for `hardware-config.nix`.
