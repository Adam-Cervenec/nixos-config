{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Adam-Cervenec";
    userEmail = "cervenec.a@protonmail.com";
  };



# --- Deklarace SW ---

  home.packages = with pkgs; [

    # TTI
    fastfetch
    btop
    alacritty

    #utils
    copyq
    flameshot

    #code
    arduino
    vscodium

    #music
    high-tide

    #3D
    cura-appimage
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-config";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        # "zsh-autosuggestions"
        # "zsh-syntax-highlighting"
        # "zsh-history-substring-search"
      ];
    };

    initContent = ''
      PROMPT='
      ╭─[%B%F{39}%2~%f%b] %F{213}${vcs_info_msg_0_}%f %(?..%F{196}✘ %?%f )%F{244}
      ╰─%F{45}(U ω U❁)%f ❯ '

      autoload -Uz vcs_info
      precmd() { vcs_info }
      zstyle ':vcs_info:git:*' formats '(%b)'

      if command -v fastfetch >/dev/null 2>&1; then
          fastfetch
      fi

      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
      zstyle ':completion:*' group-name ''
      zstyle ':completion:*' format '%F{cyan}-- %d --%f'
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      bindkey '^I' expand-or-complete
      bindkey -M menuselect '^M' accept-line
      bindkey -M menuselect ' ' accept-line
      bindkey -M menuselect '^[ ' send-break
    '';

  };

  programs.firefox.enable = true;
}
