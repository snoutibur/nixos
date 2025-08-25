{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    cdev.enable = lib.mkEnableOption "Enable c/c++ tooling";
  };

  config = lib.mkIf config.cdev.enable {
    environment.systemPackages = with pkgs; [
      # language toolchain
      gcc
      cmake
      gdb

      # tooling
      pkgs-unstable.jetbrains.clion
    ];
  };
}
