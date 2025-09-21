# common-packages.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kate
  ];
}

