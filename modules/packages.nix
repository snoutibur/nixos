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

programs.firefox.enable = true;
corepkgs.enable = true; # Must have packages
clitools.enable = true; # handy tiny CLI utilities
}
