{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    java.enable = lib.mkEnableOption "Enable java tooling";
  };

  config = lib.mkIf config.java.enable {
    environment.systemPackages = with pkgs; [
      # language
      openjdk21

      # tooling
      maven
      gradle
    ];
  };
}
