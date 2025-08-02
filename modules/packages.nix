{ config, pkgs, ... }:

{

nixpkgs.config.allowUnfree = true;

imports = [
    ./packages/bloatware.nix
    ./packages/clitools.nix
    ./packages/core.nix
    ./packages/daily.nix
    ./packages/devtools.nix
];

# Install firefox.
programs.firefox.enable = true;

corepkgs.enable = true;
clitools.enable = true;
devtools.enable = true;
daily.enable = true;
bloat.enable = true;
}
