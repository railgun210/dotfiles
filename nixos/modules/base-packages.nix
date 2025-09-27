# modules/base-packages.nix
# These are packages that are installed for every user including root.
{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Secure Boot Handler
    sbctl
    # Text editors
    vim
    # System Monitor
    btop
    # Terminal
    foot
    fish
    # Virtual Machines
    qemu
    # Utilities
    wget
    git
  ];
}
