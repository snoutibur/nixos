{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  options = {
    hardware-support.enable = lib.mkEnableOption "Add packages to interface with hardware";
  };

  config = lib.mkIf config.hardware-support.enable {
    environment.systemPackages = with pkgs; [
      gparted # Partition manager
      networkmanagerapplet # adds nm-applet for system trays
    ];
  };
}