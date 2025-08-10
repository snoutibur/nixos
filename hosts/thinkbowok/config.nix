{ config, lib, pkgs, ... }:

# / ---
#   Lenowo ThinkBook Config
# --- /

{
  imports = [
    ./hardware-configuration.nix
  ];


  # Bootloader #
  # If you're using system-d boot.
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot = {
    enable = true;
    # Autodetect windows
    extraEntries = {
      "windows.conf" = ''
        title Windows
        efi /EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };


  # Kernel #
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "25.05"; # First NixOS version this config was used on. Recommended to leave alone.


  # Packages for this machine - Check modules/packages.nix to see what these collections contain #
  daily.enable = true; # Day to day essentials
  devtools.enable = true; # Development tooling
  bloat.enable = true; # Silly fun


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
