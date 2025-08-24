{ config, lib, pkgs, ... }:

# / ---
#   Generic Configuration: Modify to your needs
#   Be sure to define your host under flake.nix!
# --- /

{
  imports = [
    ./hardware-configuration.nix # Make sure to replace this the file from your machine.
    ./packages.nix # modify this file to declare package collections
  ];


  # Bootloader - CHOOSE ONE #
  boot.loader = {
    # systemd-boot
    boot.loader.systemd-boot.enable = false;

    # grub
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };

    # For efi systems
    efi.canTouchEfiVariables = true;
  };


  # Kernel #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05"; # First NixOS version this config was used on. Recommended to leave alone.


  # Network #
  networking.hostName = "nixos"; # change this to your desired hostname. For rebuild.sh to work, this should be the same name that defined this machine.


  # Services #
  services.openssh.enable = true;


  # Firewall #
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [

  ];
  networking.firewall.allowedUDPPorts = [

  ];
}
