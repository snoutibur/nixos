{
  description = "rar!! a flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    hardware.url = "path:/etc/nixos/hardware-configuration/";
  };

  outputs = { self, nixpkgs, hardware, ... }:
  let
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = "x86_64-linux";
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
