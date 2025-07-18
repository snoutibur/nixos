{
  description = "rar!! a flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    hardware.url = "path:/etc/nixos/hardware-configuration/";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, hardware, ... }:
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = system;

      specialArgs = {
        inherit pkgs-unstable;
      };

        modules = [
          hardware.nixosModules.configuration
          ./configuration.nix
          ./modules/de.nix
          ./modules/hardware.nix
          ./modules/networking.nix
          ./modules/packages.nix
          ./modules/users.nix
        ];
      };
    };
  };
}
