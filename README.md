# nixos
My base NixOS configuration.

## Setup
(assuming you've cloned the repo)

### Hardware setup
To get started, bind `etc/nixos/hardware-configuration` to this repo by running `sudo ./templates/hwcsetup.sh`.
This script will automatically generate a wrapper flake that makes the external hardware config accessible for this repo / flake.
_This was done due to `hardware-configuration` being machine specific and auto-generated._

Eventually, this config will be updated with a `hosts/` folder to allow for machine-specific configs.

### Deploying
Flakes are considered experimental, but mature, and must be enabled. Add `experimental-features = nix-command flakes` to `/etc/nixos/configuration.nix`.

Once flakes have been enabled, you may use this flake on your system by running one of the following
```bash
cd PATH_TO_REPO
sudo nixos-rebuild switch --flake .

# 1 liner
sudo nixos-rebuild switch --flake PATH_TO_REPO
```

### Additional config
I'm not using nix home manager. Home dotfiles are managed using dotter, config at [snoutibur/dotconfig](https://github.com/snoutibur/dotConfig).