{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    hypr.enable = lib.mkEnableOption "necessary packages for hyprland setup";
  };
  
  config = lib.mkIf config.hypr.enable {
    programs.hyprland.enable = true;

    xdg.portal.enable = true;

    environment.systemPackages = with pkgs; [
      ## Apps & Window management
      wofi # launcher

      ## DE items ##
      hyprlock # lock screen
      hypridle # idle daemon

      swww # background setter
      hyprcursor

      pkgs-unstable.hyprpanel # bar
      pamixer # Media controls
      eww # widgets


      ## Utils ##
      grim # CLI scrnshot tool
      slurp # scrnshot regions
      swappy # Image editor/annotator


      ## System control ##
      brightnessctl # Display brightness
      hyprsunset # night shift


      ## Libs ##
      hyprland-qt-support # patches
      hyprland-qtutils # additional QT patches

      hyprpolkitagent # Needed for GUI apps to request elevated perms

      xdg-desktop-portal-hyprland # comm to compositor thru D-Bus
      xdg-desktop-portal-gtk # additional desktop interactions

      xwayland # bridge x11 -> wayland
      libnotify # notif handler
      playerctl # media control
    ];
};
}
