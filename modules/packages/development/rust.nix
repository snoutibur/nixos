{ config, pkgs, pkgs-unstable, lib, ... }:

{
  options = {
    rust.enable = lib.mkEnableOption "Enable rust tooling";
  };

  config = lib.mkIf config.rust.enable {
    environment.systemPackages = with pkgs; [
        # toolchain
        rustup

        # editor
        pkgs-unstable.jetbrains.rust-rover
    ];
  };
}
