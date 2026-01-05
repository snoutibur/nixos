{ config, lib, pkgs, ... }:

{
  # Enable package sets for this machine
  daily.enable = true;
  productivity.enable = true;
  games.enable = true;
  bloat.enable = true;

  # Development
  devtools.enable = true;
  cdev.enable = false;
  csdev.enable = true;
  java.enable = true;
  js.enable = true;
  pydev.enable = false;
  rust.enable = false;
}
