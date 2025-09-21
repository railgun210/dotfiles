# common-packages.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Chat
    discord
    # Email client
    evolution
    # Gaming
    steam
    # Media  
    vlc
    # Productivity
    anki-bin
    todoist
    calibre
    rustup
    # Utilities
    fastfetch
    qbittorrent
  ];
}

