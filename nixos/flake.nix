# /etc/nixos/flake.nix
{
  description = "Railgun's NixOS Flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    # Add Home Manager as a flake input
    home-manager.url = "github:nix-community/home-manager";
    # Make it follow your nixpkgs to avoid mismatched versions between your home and system
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.railgun-linux-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Or your system architecture
      specialArgs = { inherit inputs; }; # Pass inputs to modules
      modules = [
        ./configuration.nix # Your main NixOS configuration
        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.backupFileExtension = ".bak";
          home-manager.users.railgun = import ./home.nix; # Link user config
        }
      ];
    };
  };
}
