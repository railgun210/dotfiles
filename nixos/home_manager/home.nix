{ config, pkgs, ... }:

let
  homeManagerDir = ./home_manager; # directory with sub-configs
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "unstable"; # set to unstable
  home.username = "citypop";
  home.homeDirectory = "/home/citypop";

  # Include other configuration files
  imports = [
    "${homeManagerDir}/common-packages.nix"
    "${homeManagerDir}/development-tools.nix"
    "${homeManagerDir}/desktop-environment.nix"
    "${homeManagerDir}/pyenv.nix"
  ];

  # Default shell
  programs.fish.enable = true;
  users.users.citypop.shell = pkgs.fish;
}