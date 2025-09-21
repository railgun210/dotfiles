# /etc/nixos/flake.nix
{
  description = "Citypop's NixOS Flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    # Add Home Manager as a flake input
    home-manager.url = "github:nix-community/home-manager";
    # Make it follow your nixpkgs to avoid mismatched versions
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations = {
      citypop-linux-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}