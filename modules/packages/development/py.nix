{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    pydev.enable = lib.mkEnableOption "Enable Python tooling";
  };

  config = lib.mkIf config.pydev.enable {
    environment.systemPackages = with pkgs; [
      # language toolchain
      python313
      python313Packages.pip
      python313Packages.virtualenv
      python313Packages.notebook

      # tooling
      pkgs-unstable.jetbrains.pycharm
    ];
  };
}
