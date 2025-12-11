{ config, lib, pkgs, ... }:

{
  # Enable package sets for this machine
  daily.enable = true;
  productivity.enable = true;
  bloat.enable = true;

  devtools.enable = true;
  cdev.enable = false;
  java.enable = true;
  js.enable = true;
  pydev.enable = true;
  rust.enable = true;
}