# nixos
My base NixOS setup.

I'm not using nix home manager. Home dotfiles are currently managed by [Dotter](https://github.com/SuperCuber/dotter).

You can find my Linux dotfiles on GitHub when they're ready.


## Setup
This assumes you've cloned the repo, and have enabled flakes on your system.


### Hardware setup
To get started, define your machine under `hosts/`. Copy and/or modify `hosts/nixos/`. Be sure to rename the folder to your hostname.


### Deploying
A rebuild script is bundled in this repo to save time on rebuilding the system.
```bash
cd PATH_TO_REPO

./rebuild.sh
./rebuild.sh hostname
```

**For your first** run, it's recommended to use `./rebuild.sh hostname` to make sure that you're building for the right host defined under `hosts/`. Make sure that you changed your hostname under `hosts/yourmachine/config.nix`.

**For all subsequent runs**, run `./rebuild.sh` and the script will automatically assume that your configuration in `hosts/` is the same as your hostname. If you renamed anything, run as if it's your first run just to be safe.