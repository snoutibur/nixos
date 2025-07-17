This Nix configuration uses an external hardware config file due to its nature for being machine specific and containing somewhat personal information.

Run `hwcsetup.sh` to automaticaly create the file in `/etc/nixos/` that serves as the wrapper flake for `hardware-config.nix`.
