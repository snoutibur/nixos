{ config, lib, pkgs, ... }:

# / ---
#   Lenowo ThinkBook Config
# --- /

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];


  # Bootloader
  boot.loader = {
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

  # Shared partition
  fileSystems."/mnt/Shared" = {
    device = "/dev/disk/by-uuid/160C-B9B6";
    fsType = "exfat";
    options = [ "defaults" "uid=1000" "gid=100" ];
    neededForBoot = false;
  };
}
