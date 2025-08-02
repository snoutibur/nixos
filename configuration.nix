{ config, pkgs, ... }:

{
  # Bootloader
  # TODO: make this generic
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

#  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "/dev/sda";
#  boot.loader.grub.useOSProber = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05";

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc.automatic = true; # Periodically clean out rubbish
  nix.gc.options = "--delete-old"; # Nuke old generations

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
