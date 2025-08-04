{ config, pkgs, lib, ... }:

{
  options = {
    hypr.enable = lib.mkEnableOption "necessary packages for hyprland setup";
  };
  
  config = lib.mkIf config.hypr.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      brightnessctl # Display brightness
      hyprpaper # background setter
      hyprsunset # night shift
      pamixer # Media controls

      grim # CLI scrnshot tool
      slurp # scrnshot regions

      mako # notifs
      waybar # status bar
      eww # widgets
      wofi # launcher
      wl-clipboard # clipboard functionality

      hyprlock # lock screen
      hypridle # idle daemon

      hyprland-qt-support # patches
      hyprland-qtutils # additional QT patches
      xdg-desktop-portal-hyprland # comm to compositor thru D-Bus
      hyprpolkitagent # Needed for GUI apps to request elevated perms
    ];
};
}
