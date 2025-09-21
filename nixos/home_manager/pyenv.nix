{ config, pkgs, ... }:

{
  programs.pyenv = {
    enable = true;
    enableFishIntegration = true;
  };

  # Ensure necessary build dependencies are available if you plan to compile Python versions
  home.packages = with pkgs; [
    gcc
    gnumake
    zlib
    libffi
    readline
    bzip2
    openssl
    ncurses
  ];
}