{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    csdev.enable = lib.mkEnableOption "Enable C# and .NET tooling";
  };

  config = lib.mkIf config.csdev.enable {
    environment.systemPackages = with pkgs; [
      # language toolchain


      # tooling
      pkgs-unstable.jetbrains.rider
    ];
  };
}
