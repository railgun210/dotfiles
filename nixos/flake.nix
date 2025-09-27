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
    # Lanzaboote handles Secure Boot for us
    # 0.4.2 is the latest version as of 26 SEP 2025
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = { 
      url = "github:nixos/nixpkgs/nixos-unstable";
      inputs.sops-nix.url = "github:Mic92/sops-nix";
    };
  };

  outputs = { self, nixpkgs, home-manager, lanzaboote, sops-nix, ... }@inputs: {
    nixosConfigurations.railgun-linux-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Or your system architecture
      specialArgs = { inherit inputs; }; # Pass inputs to modules
      modules = [
        lanzaboote.nixosModules.lanzaboote
        sops-nix.nixosModules.sops
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
