{ config, pkgs, lib, ... }:

{
  options = {
    productivity.enable = lib.mkEnableOption "Enables office suite";
  };

  config = lib.mkIf config.productivity.enable {
    environment.systemPackages = with pkgs; [
      # Markdown & LaTeX
      pandoc
      texliveFull
    ];
  };
}
