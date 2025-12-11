{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    js.enable = lib.mkEnableOption "Enable HTML/CSS/JS tooling";
  };

  config = lib.mkIf config.js.enable {
    environment.systemPackages = [
      # language
      pkgs.bun
      pkgs.yarn
      pkgs.electron

      # tooling
      pkgs-unstable.jetbrains.webstorm
    ];

    # Allows Electron to discover itself
    environment.variables.ELECTRON_OVERRIDE_DIST_PATH = "${pkgs.electron}";
  };
}
