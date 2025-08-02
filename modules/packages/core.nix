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
    ];
  };
}