{ config, lib, pkgs, ... }:

{
  # Enable package sets for this machine
  daily.enable = true;
  hardware-support.enable = true;
  bloat.enable = true;

  devtools.enable = true;
  cdev.enable = true;
  java.enable = true;
  rust.enable = true;
}