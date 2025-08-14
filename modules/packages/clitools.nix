{ config, pkgs, lib, ... }:

{
  options = {
    clitools.enable = lib.mkEnableOption "enables CLI tool packages";
  };

  config = lib.mkIf config.clitools.enable {
    environment.systemPackages = with pkgs; [
        # System management
        tmux
        btop
        fastfetch
        # Files
        lazygit
        tree
        unzip
        wget
    ];
  };
}
