{ config, pkgs, ... }:


{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.05"; # set to unstable
  home.username = "citypop";
  home.homeDirectory = "/home/citypop";

  # Include other configuration files
  imports = [
    ./common-packages.nix
    ./development-tools.nix
    ./desktop-environment.nix
    ./pyenv.nix
  ];

  # Setup backups so old configs aren't obliterated
  home-manager = {
    backupFileExtension = "backup";
  };

  # Default shell
  programs.fish.enable = true;
}