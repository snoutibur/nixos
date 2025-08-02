{ config, lib, pkgs, ... }:

{
  # Bootloader & Latest kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Host-specific configuration
  networking.hostName = "nixos";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";

  imports = [
    ./hardware-configuration.nix

    # Import common modules
    ../../configuration.nix # Common config files
    ../../modules/de.nix # Desktop environment
    ../../modules/hardware.nix
    ../../modules/networking.nix
    ../../modules/packages.nix
    ../../modules/shell.nix
    ../../modules/users.nix
  ];
}