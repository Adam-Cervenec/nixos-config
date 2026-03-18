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


        initExtra = ''
            export PROMPT='
            ╭─[%B%F{39}%2~%f%b] %F{213}${vcs_info_msg_0_}%f %(?..%F{196}✘ %?%f )%F{244}
            ╰─%F{45}(U ω U❁)%f ❯ '
        '';
    };
}