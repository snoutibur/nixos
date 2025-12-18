{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    games.enable = lib.mkEnableOption "GAYMING!";
  };

  config = lib.mkIf config.games.enable {
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };
}