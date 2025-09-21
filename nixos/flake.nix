# /etc/nixos/flake.nix
{
  description = "Citypop's NixOS Flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    # Add Home Manager as a flake input
    home-manager.url = "github:nix-community/home-manager";
    # Make it follow your nixpkgs to avoid mismatched versions between your home and system
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = { self, nixpkgs, home-manager }:
    let
      homeManagerDir = ./home_manager;
      system = "x86_64-linux";
      username = "citypop";
    in { 
      nixosConfigurations = {
        citypop-linux-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
          ];
        };
      };
      homeConfigurations = {
        citypop = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            "${homeManagerDir}/common-packages.nix"
            "${homeManagerDir}/home-configuration.nix"
            "${homeManagerDir}/desktop-environment.nix"
            "${homeManagerDir}/pyenv.nix"
          ];
          inherit username;
          homeDirectory = "/home/${username}";
        };
      };
    };
}