{ config, lib, pkgs, ... }:

{
  # Enable package sets for this machine
  daily.enable = true;
  bloat.enable = true;

  devtools.enable = true;
  rust.enable = true;
}