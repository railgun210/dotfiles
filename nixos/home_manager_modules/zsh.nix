# development-tools.nix
{ config, pkgs, ... }:

{
    programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true; # May enable other completions

    ohMyZsh = {
      enable = true;
      plugins = ["git"];
      # Set theme to Powerlevel10k
      theme = "powerlevel10k/powerlevel10k";
    };

    # Add any custom Zsh configuration here that is not handled by Oh My Zsh or Home Manager
    # For example, to source your custom Powerlevel10k configuration file:
    initExtra = ''
      # Source the Powerlevel10k configuration file
      if [[ -f "$HOME/.p10k.zsh" ]]; then
        source "$HOME/.p10k.zsh"
      fi
    '';
  };

  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-completions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-history-substring-search
  ];
}

