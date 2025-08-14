{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    devtools.enable = lib.mkEnableOption "enable development tooling & packages";
  };

  config = lib.mkIf config.devtools.enable {
    environment.systemPackages = with pkgs; [
        kdePackages.kate # basic text editor
        trufflehog # secrets scanner
        git-filter-repo # rewriting git history

        # Rust development
        pkgs-unstable.cargo
        pkgs-unstable.rustc

        # Jetbrains tooling
        pkgs-unstable.jetbrains.idea-ultimate
        pkgs-unstable.jetbrains.rust-rover
        pkgs-unstable.jetbrains-toolbox
    ];
  };
}
