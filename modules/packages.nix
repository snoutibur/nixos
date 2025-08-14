{ config, pkgs, ... }:

{
nixpkgs.config.allowUnfree = true;

imports = [
  # essentials
  ./packages/core.nix
  ./packages/daily.nix

  # Development
  ./packages/clitools.nix
  ./packages/development/devtools.nix
  ./packages/development/rust.nix

  # Misc
  ./packages/bloatware.nix
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
