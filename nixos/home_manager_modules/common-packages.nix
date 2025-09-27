# common-packages.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Chat
    discord
    # Email client
    evolution
    # Media  
    vlc
    # Productivity
    anki-bin
    todoist
    calibre
    # Utilities
    fastfetch
    qbittorrent
    age # Encryption tool
  ];
}

