{ config, pkgs, ... }:

{
# Enable the X11 windowing system. Can be disabled if uisng a pure wayland setup.
services.xserver.enable = true;

# Enable the KDE Plasma Desktop Environment.
services.displayManager.sddm.enable = true;
services.desktopManager.plasma6.enable = true;

# Configure keymap in X11
services.xserver.xkb = {
    layout = "us";
    variant = "";
};
}
