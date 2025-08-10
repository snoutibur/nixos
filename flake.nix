{
  description = "NixOS system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";	# home manager could use the existing nixpkgs declaration.
    };
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
  in {
    nixosConfigurations = {
      # Make sure you define your host in here too!

      hp-aio = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/hp-aio/config.nix ] ++ commonModules;

        specialArgs = {
          inherit pkgs pkgs-unstable;
        };
      };

      thinkbowok = lib.nixosSystem {
        modules = [ ./hosts/thinkbowok/config.nix ] ++ commonModules;
        specialArgs = {
          inherit pkgs pkgs-unstable inputs;
        };
      };

    };
  };
}
