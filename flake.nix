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

    # Import nixpkgs with allowUnfree enabled
    pkgs = import nixpkgs {
      system = system;
      config = {
        allowUnfree = true;
      };
    };

    pkgs-unstable = import nixpkgs-unstable {
      system = system;
      config = {
        allowUnfree = true;
      };
    };

    commonModules = [
      ./configuration.nix
      ./modules/de.nix
      ./modules/hardware.nix
      ./modules/packages.nix
      ./modules/shell.nix
      ./modules/users.nix
    ];
  in
  {
    nixosConfigurations = {
      hp-aio = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/hp-aio/config.nix ] ++ commonModules;

        specialArgs = {
          inherit pkgs pkgs-unstable;
        };
      };
    };
  };
}
