{ config, pkgs, lib, ... }:

{
  options = {
    clitools.enable = lib.mkEnableOption "enables CLI tool packages";
  };

  config = lib.mkIf config.clitools.enable {
    environment.systemPackages = with pkgs; [
        btop
        fastfetch
        tree
    ];
  };
}
