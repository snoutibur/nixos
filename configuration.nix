{ config, pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-old";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
