{ config, pkgs, ... }:

let
  homeManagerDir = ./home_manager_modules;
in {
  nixpkgs.config = {
    allowUnfree = true;
  };
  home.stateVersion = "25.05"; # set to unstable
  home.username = "railgun";
  home.homeDirectory = "/home/railgun";

  # Include other configuration files
  imports = [
    "${homeManagerDir}/common-packages.nix"
    "${homeManagerDir}/development-tools.nix"
    "${homeManagerDir}/desktop-environment.nix"
    "${homeManagerDir}/pyenv.nix"
  ];
}
