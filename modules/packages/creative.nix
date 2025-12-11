{ config, pkgs, lib, ... }:

{
  options = {
    creative.enable = lib.mkEnableOption "Arts programs";
  };

  config = lib.mkIf config.creative.enable {
    environment.systemPackages = with pkgs; [
      inochi-creator
    ];
  };
}