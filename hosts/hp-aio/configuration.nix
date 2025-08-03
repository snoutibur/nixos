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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";


  # Packages #
  daily.enable = true; # Day to day essentials
  devtools.enable = true; # Development tooling
  bloat.enable = true; # Silly fun


  # Network #
  networking.hostName = "nixos";
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