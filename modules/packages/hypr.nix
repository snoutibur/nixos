{ config, pkgs, pkgs-unstable, lib, ... }:

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

      swww # background setter
      hyprcursor
      
      grim # CLI scrnshot tool
      slurp # scrnshot regions

      pkgs-unstable.hyprpanel # bar
      mako # notifs
      eww # widgets
      pamixer # Media controls

      ## Libs ##
      hyprland-qt-support # patches
      hyprland-qtutils # additional QT patches
      xdg-desktop-portal-hyprland # comm to compositor thru D-Bus
      hyprpolkitagent # Needed for GUI apps to request elevated perms
    ];
};
}
