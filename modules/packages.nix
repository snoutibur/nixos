{ config, pkgs, ... }:

{
imports = [
  ./packages/bloatware.nix
  ./packages/clitools.nix
  ./packages/core.nix
  ./packages/daily.nix
  ./packages/devtools.nix
];

programs.firefox.enable = true; # need a web browser
corepkgs.enable = true; # Must have packages
fonts.fontconfig.enable = true; # essential fonts
clitools.enable = true; # handy tiny CLI utilities
}
