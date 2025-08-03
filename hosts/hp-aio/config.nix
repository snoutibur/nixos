{ config, lib, pkgs, ... }:

# / ---
#   HP AIO configuration
# --- /


{
  imports = [
    ./hardware-configuration.nix
  ];


  # Bootloader & Latest kernel #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05"; # Initial NixOS install version. Recommended to leave alone.


  # Packages #
  daily.enable = true; # Day to day essentials
  devtools.enable = true; # Development tooling
  bloat.enable = true; # Silly fun


  # Network #
  networking.hostName = "hp-aio";
  networking.networkmanager.enable = true; # Enables networking

  # Services
  services.openssh.enable = true;

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    22    # SSH
  ];
  networking.firewall.allowedUDPPorts = [

  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}