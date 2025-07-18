{ config, pkgs, lib ... }:

{
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    environment.systemPackages = with pkgs; [
        oh-my-zsh
        starship
    ];
}
