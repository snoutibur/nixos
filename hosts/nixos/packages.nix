{ config, lib, pkgs, ... }:

{
  # Enable additional package sets for this machine.
  # Check modules/packages/ to see what these collections include.
  # this file lists all available collections
  # Some packages are always enabled, check modules/packages.nix for details
  # Other packages are installed as part of another module, such as hyprland in DE.nix

  daily.enable = true; # Day to day essentials
  bloat.enable = false; # Silly fun

  # Developer #
  devtools.enable = false; # base development tooling
  rust.enable = false;


  # Define one-off packages for this machine
    packages = with pkgs; [

  ];
}