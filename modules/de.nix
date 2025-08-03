{ config, lib, pkgs, ... }:

{
imports = [
  ./packages/hypr.nix
];

# Enable the X11 windowing system. Can be disabled if using a pure wayland setup.
services.xserver.enable = true;

# Desktop Environments
services.displayManager.sddm.enable = true;
services.desktopManager.plasma6.enable = true;
hypr.enable = true;

# Configure keymap in X11
services.xserver.xkb = {
  layout = "us";
  variant = "";
};
}
