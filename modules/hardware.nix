{ config, pkgs, ... }:

{
# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};

# Enable touchpad support (enabled default in most desktopManager).
services.libinput.enable = true;

## Networking ##
networking.networkmanager.enable = true; # Enables networking

## File Systems & Partitions
boot.supportedFilesystems = [ "exfat" ];

# Supporting packages
environment.systemPackages = with pkgs; [
  gparted # Partition manager
  networkmanagerapplet # adds nm-applet for system trays
];
}
