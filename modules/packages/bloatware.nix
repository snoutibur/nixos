{ config, pkgs, lib, ... }:

{
  options = {
    bloat.enable = lib.mkEnableOption "Useless fun items";
  };

  config = lib.mkIf config.bloat.enable {
    environment.systemPackages = with pkgs; [
        cava # audio visualizer
        cbonsai # trees
        cowsay # Ascii cow & more :33
        figlet # Text to big ascii "art" text
        fortune # fortune...
        peaclock # TUI clock
        pipes # PIIIPES
    ];
  };
}
