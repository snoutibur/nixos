{ config, pkgs, ... }:

{

imports = [
    ./packages/core.nix
    ./packages/clitools.nix
    ./packages/devtools.nix
];

corepkgs.enable = true;
clitools.enable = true;
devtools.enable = true;

# Install firefox.
programs.firefox.enable = true;

# Allow unfree packages
nixpkgs.config.allowUnfree = true;
}
