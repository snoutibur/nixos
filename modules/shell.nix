{ config, pkgs, lib, ... }:

{
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;

environment.systemPackages = with pkgs; [
  kitty
  oh-my-zsh
  starship
];
}
