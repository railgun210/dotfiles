{ config, pkgs, ... }:


{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.05"; # set to unstable
  home.username = "citypop";
  home.homeDirectory = "/home/citypop";

  # Default shell
  programs.fish.enable = true;

  # Include other configuration files
  imports = [
    ./common-packages.nix
    ./development-tools.nix
    ./desktop-environment.nix
    ./pyenv.nix
  ];
}