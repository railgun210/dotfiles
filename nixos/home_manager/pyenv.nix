{ config, pkgs, ... }:

{
  programs.pyenv = {
    enable = true;
    # Optionally, specify the root directory for pyenv installations
    pyenvRoot = "${config.home.homeDirectory}/.pyenv";
    #Optionally, enable shims and autocompletion for your shell
    # shellInit = ''
    #   export PYENV_ROOT="${config.home.homeDirectory}/.pyenv"
    #   export PATH="$PYENV_ROOT/bin:$PATH"
    #   eval "$(pyenv init --path)"
    #   eval "$(pyenv init -)"
    #   eval "$(pyenv virtualenv-init -)"
    # '';
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