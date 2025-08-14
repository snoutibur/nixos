{ config, lib, pkgs, ... }:

# / ---
#   Lenowo ThinkBook Config
# --- /

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];


  # Bootloader #
  # If you're using system-d boot.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    enable = true;
  };

  # Kernel #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05"; # First NixOS version this config was used on. Recommended to leave alone.


  # Network #
  networking.hostName = "thinkbowok";


  # Services #
  services.openssh.enable = true;


  # Firewall #
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    22 # ssh
  ];
  networking.firewall.allowedUDPPorts = [

  ];
}
