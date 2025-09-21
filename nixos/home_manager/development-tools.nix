# development-tools.nix
{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "aday56709@gmail.com";
    userName = "railgun210";
  };

  home.packages = with pkgs; [
    # Rust Tools
    cargo
    rustup
    # General Development Tools
    docker
    emacs
    # Code Editors
    vscode
    neovim
  ];
}

