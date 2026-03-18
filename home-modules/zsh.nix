#zsh.nix

{ config, pkgs, ... }:

{


    programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
            ];
            theme = "robbyrussell";
        };


        initContent = ''
            
            #fastfetch
            if command -v fastfetch >/dev/null 2>&1; then
                fastfetch
            fi

            #git cosi
            autoload -Uz vcs_info
            precmd() { vcs_info }
            zstyle ':vcs_info:git:*' formats '(%b)'

            # Funkce pro získání git větve
            git_branch() {
            git rev-parse --is-inside-work-tree &>/dev/null && \
            echo " (%F{33}$(git symbolic-ref --short HEAD)%f)"
            }

            PROMPT='
            ╭─[%B%F{39}%2~%f%b] %F{213}$%f %(?..%F{196}✘ %?%f )%F{244}
            ╰─%F{45}(U ω U❁)%f$(git_branch) ❯ '
        '';
    };
}