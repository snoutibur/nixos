{
  description = "NixOS system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

    commonModules = [
        ./configuration.nix
        ./modules/de.nix
        ./modules/hardware.nix
        ./modules/packages.nix
        ./modules/shell.nix
        ./modules/users.nix
      ];
  in {
    nixosConfigurations = {
      # Make sure you define your host in here too!

      hp-aio = lib.nixosSystem {
        modules = [./hosts/hp-aio/config.nix] ++ commonModules;

        specialArgs = {
          inherit pkgs-unstable;
        };
      };

      thinkbowok = lib.nixosSystem {
        modules = [ ./hosts/thinkbowok/config.nix ] ++ commonModules;
        specialArgs = { inherit pkgs-unstable; };
      };

    };
  };
}
