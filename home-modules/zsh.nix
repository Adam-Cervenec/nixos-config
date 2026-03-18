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
    };
}