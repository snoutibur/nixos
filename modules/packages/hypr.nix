{ config, pkgs, lib, ... }:

{
  options = {
    hypr.enable = lib.mkEnableOption "necessary packages for hyprland setup";
  };
  
  config = lib.mkIf config.hypr.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      ## Apps & Window management
      wofi # launcher

      ## System control ##
      brightnessctl # Display brightness
      hyprsunset # night shift

      ## DE items ##
      hyprlock # lock screen
      hypridle # idle daemon

      pamixer # Media controls
      swww # background setter

      grim # CLI scrnshot tool
      slurp # scrnshot regions

      mako # notifs
      eww # widgets
      waybar # status bar

      wl-clipboard # clipboard functionality

      ## Libs ##
      hyprland-qt-support # patches
      hyprland-qtutils # additional QT patches
      xdg-desktop-portal-hyprland # comm to compositor thru D-Bus
      hyprpolkitagent # Needed for GUI apps to request elevated perms
    ];
};
}
