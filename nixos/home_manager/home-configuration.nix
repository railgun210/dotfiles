{ config, pkgs, ... }:


{
  programs.fish.enable = true;
  users.users.citypop.shell = pkgs.fish;
}
