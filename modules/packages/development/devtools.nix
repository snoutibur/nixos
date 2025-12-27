{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    devtools.enable = lib.mkEnableOption "Enables general development tooling";
  };

  config = lib.mkIf config.devtools.enable {
    environment.systemPackages = with pkgs; [
        kdePackages.kate # basic text editor
        trufflehog # secrets scanner
        git-filter-repo # rewriting git history

        # Common dependencies
        gcc
        stdenv.cc.cc.lib

        # Editors
        zed-editor # lightweight editor
        pkgs-unstable.jetbrains.idea # heavyweight editor

        # Distrobox & Containers
        distrobox
        podman
        podman-desktop
    ];

        # Allows environment access to libstdc++.so.6
        environment.variables.LD_LIBRARY_PATH =
          "${pkgs.stdenv.cc.cc.lib}/lib";
  };
}
