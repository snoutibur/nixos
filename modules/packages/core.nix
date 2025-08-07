{ config, pkgs, lib, ... }:

{
  options = {
    corepkgs.enable = lib.mkEnableOption "enables essential packages";
  };

  config = lib.mkIf config.corepkgs.enable {
    environment.systemPackages = with pkgs; [
      # Required for system management
      git
      dotter # Dotfile manager
      konsave # KDE Plasma config manager

      # Wayland font rendering
      fontconfig
      freetype

      wl-clipboard # clipboard functionality in wayland

      # icon rendering
      adwaita-icon-theme
      papirus-icon-theme
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome

      # Icon packs
      material-design-icons
      material-icons
      material-symbols
    ];
  };
}