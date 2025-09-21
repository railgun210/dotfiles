{ config, pkgs, ... }:

{
  home.username = "citypop";
  home.homeDirectory = "/home/citypop";

  programs.fish.enable = true;

  home.packages = with pkgs; [
    kdePackages.kate
  ];
}
