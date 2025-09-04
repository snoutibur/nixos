{
  description = "Home Manager configuration of doge";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland"; # math versions
    };
  };

  outputs =
    { nixpkgs, home-manager, hyprland-plugins, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."doge" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example, the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs to pass through arguments to home.nix
      };
    };
}
