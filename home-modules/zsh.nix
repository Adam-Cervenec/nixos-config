#zsh.nix

{ config, pkgs, ... }:

{


    programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)";
            boot = "sudo nixos-rebuild boot --flake ~/nixos-config#$(hostname)";
            test = "sudo nixos-rebuild test --flake ~/nixos-config#$(hostname)";
            update = "nix flake update";
            upgrade = "nix flake update && sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)";
            rollback = "sudo nixos-rebuild switch --rollback";
        };

        oh-my-zsh = {
            enable = true;
            plugins = [
                "git"
            ];
            theme = "robbyrussell";
        };



        initContent = ''

            #zkratka pro git
            save() {
            git add .
            git commit -m "$*"
            }

            
            #fastfetch
            if command -v fastfetch >/dev/null 2>&1; then
                fastfetch
            fi


            #git cosi
            autoload -Uz vcs_info
            precmd() { vcs_info }
            zstyle ':vcs_info:git:*' formats '(%b)'

            # Funkce pro získání git větve a statusu
            git_branch() {
            # Zjistí, jestli jsme v git repozitáři
            if git rev-parse --is-inside-work-tree &>/dev/null; then
                # Získá název větve
                branch=$(git symbolic-ref --short HEAD)
                
                # Zkontroluje, jestli jsou necommitnuté změny
                if [[ -n $(git status --porcelain) ]]; then
                # Pokud jsou změny, přidá křížek (✘) žlutě za větev
                echo " (%F{33}$branch%f)%F{3} ✘%f"
                else
                # Pokud není nic změněného, jen zobrazuje název větve
                echo " (%F{33}$branch%f)"
                fi
            fi
            }

            PROMPT='
            ╭─[%B%F{39}%2~%f%b] %F{213}$%f %(?..%F{196}✘ %?%f )%F{244}
            ╰─%F{45}(U ω U❁)%f$(git_branch) ❯ '
        '';
    };
}