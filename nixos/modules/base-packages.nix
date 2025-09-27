# modules/base-packages.nix
# These are packages that are installed for every user including root.
{ config, pkgs, ... }: {
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    # Secure Boot Handler
    sbctl
    # Text editors
    vim
    # System Monitor
    btop
    # Terminal
    foot
    bash
    # Virtual Machines
    qemu
    # Utilities
    wget
    git
    sops
  ];
}
