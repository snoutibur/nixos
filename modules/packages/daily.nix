{ config, pkgs, lib, ... }:

{
  options = {
    daily.enable = lib.mkEnableOption "Enables everyday programs";
  };

  config = lib.mkIf config.daily.enable {
    environment.systemPackages = with pkgs; [
      obsidian
      spotify
      vesktop
      element-desktop
    ];
  };
}