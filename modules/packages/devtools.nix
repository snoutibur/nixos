{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    devtools.enable = lib.mkEnableOption "enable development tooling & packages";
  };

  config = lib.mkIf config.devtools.enable {
    environment.systemPackages = with pkgs; [
        kdePackages.kate
        jetbrains.idea-ultimate
        trufflehog
    ] ++ (with pkgs-unstable; [

    ]);
  };
}
