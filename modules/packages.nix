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

environment.sessionVariables = {
  NIXOS_OZONE_WL = "1"; # Tell electron apps to use wayland
};

services.dbus.enable = true; # typically enabled by default

programs.firefox.enable = true; # need a web browser
corepkgs.enable = true; # Must have packages
fonts.fontconfig.enable = true; # essential fonts
clitools.enable = true; # handy tiny CLI utilities
}
