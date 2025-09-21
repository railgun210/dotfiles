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
      pkgs = import nixpkgs { inherit system; };
    in { 
      nixosConfigurations = {
        citypop-linux-desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
        };
      };
      homeConfigurations = {
        citypop = home-manager.lib.homeManagerConfiguration {
          # Setup backups so old configs aren't obliterated
          home-manager.backupFileExtension = ".backup";
          home-manager.useUserPackages = true;
          inherit pkgs;
          modules = [
            "${homeManagerDir}/home.nix"
          ];
        };
      };
    };
}