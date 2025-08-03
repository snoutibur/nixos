{ config, pkgs, lib, ... }:

{
  options = {
    hypr.enable = lib.mkEnableOption "necessary packages for hyprland setup";
  };
  
  config = lib.mkIf config.hypr.enable {
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; [
      brightnessctl # Display brightness
      swaybg # background setter
      pamixer # Media controls

      grim # CLI scrnshot tool
      slurp # scrnshot regions

      mako # notifs
      waybar # status bar
      wofi # launcher
      wl-clipboard # clipboard functionality
    ];
};
}
