{ config, pkgs, ... }:

{
nixpkgs.config.allowUnfree = true;

imports = [
  # essentials
  ./packages/core.nix # necessities for the system to run or read dotfiles
  ./packages/daily.nix # essential everyday tools

  # Tooling
  ./packages/productivity.nix # Office suite & Helpers
  ./packages/creative.nix # Creative suite

  # Development
  ./packages/clitools.nix # helpful CLI utilities
  ./packages/development/devtools.nix # Essential development tools

  # language dev environments
  ./packages/development/cpp.nix
  ./packages/development/csharp.nix
  ./packages/development/java.nix
  ./packages/development/js.nix
  ./packages/development/py.nix
  ./packages/development/rust.nix

  # Misc
  ./packages/bloatware.nix # fun packages
  ./packages/games.nix # GAYMING!!
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
