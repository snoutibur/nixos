{ config, lib, pkgs, ... }:

# / ---
#   Generic Configuration: Modify to your needs
# --- /

{
  imports = [
    ./hardware-configuration.nix # Make sure to replace this the file from your machine.
  ];


  # Bootloader #
  # If you're using system-d boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05"; # First NixOS version this config was used on. Recommended to leave alone.


  # Packages for this machine - Check modules/packages.nix to see what these collections contain #
  daily.enable = true; # Day to day essentials


  # Network #
  networking.hostName = "nixos"; # change this to your desired hostname
  networking.networkmanager.enable = true;

  # Services #
  services.openssh.enable = true;

  # Firewall #
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [

  ];
  networking.firewall.allowedUDPPorts = [

  ];
}