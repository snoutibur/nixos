{ config, pkgs, lib, ... }:

{
  options = {
    bloat.enable = lib.mkEnableOption "Useless fun items";
  };

  config = lib.mkIf config.bloat.enable {
    environment.systemPackages = with pkgs; [
        cmatrix # cool haxxer
        cava # audio visualizer
        cbonsai # trees
        cowsay # Ascii cow & more :33
        asciiquarium
        figlet # Text to big ascii "art" text
        fortune # fortune...
        peaclock # TUI clock
        pipes # PIIIPES
        activate-linux # capitalist aaa watermark
    ];
  };
}
