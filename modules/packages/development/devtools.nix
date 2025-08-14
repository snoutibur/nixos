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

        # Jetbrains tooling
        pkgs-unstable.jetbrains.idea-ultimate # I typically use Idea as my main editor
        pkgs-unstable.jetbrains-toolbox
    ];
  };
}
