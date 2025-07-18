{ config, pkgs, ... }:

{

nixpkgs.config.allowUnfree = true;

imports = [
    ./packages/core.nix
    ./packages/clitools.nix
    ./packages/devtools.nix
];

# Install firefox.
programs.firefox.enable = true;

corepkgs.enable = true;
clitools.enable = true;
devtools.enable = true;
}
