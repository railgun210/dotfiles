# development-tools.nix
{ config, pkgs, ... }:

{
    programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true; # May enable other completions
    plugins = [
      {                                                                                   
        name = "powerlevel10k";                                                           
        src = pkgs.zsh-powerlevel10k;                                                     
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";                         
      }
    ];
    oh-my-zsh = {
      enable = true;
    };

    # Add any custom Zsh configuration here that is not handled by Oh My Zsh or Home Manager
    # For example, to source your custom Powerlevel10k configuration file:
    initExtra = ''
      source ~/.p10k.zsh
      # Source the Powerlevel10k configuration file
      if [[ -f "$HOME/.p10k.zsh" ]]; then
        source "$HOME/.p10k.zsh"
      fi
    '';
  };

  home.packages = with pkgs; [
    oh-my-zsh
    zsh-completions
    zsh-syntax-highlighting
    zsh-history-substring-search
  ];
}

