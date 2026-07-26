#zsh.nix

{ config, pkgs, cfg, lib, ... }:
let
    profile = cfg.profile or {};

in

#if zsh is enabled, define zsh...
lib.mkIf (profile.zsh.enable or false) {


    programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            rebuild-old = "sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)";
            rebuild = "nh os switch ~/nixos-config#$(hostname)";
            boot = "sudo nixos-rebuild boot --flake ~/nixos-config#$(hostname)";
            update = "nix flake update";
            rollback = "sudo nixos-rebuild switch --rollback";
            #clean = "sudo nix-collect-garbage -d";

            test = "sudo nixos-rebuild test --flake ~/nixos-config#$(hostname) --show-trace";
            eval = "nix eval .#nixosConfigurations.$(hostname).config.system.build.toplevel";
            
        };

        plugins = [
            {
            name = "zsh-autosuggestions";
            src = pkgs.zsh-autosuggestions;
            }
        ];

        setOptions = [
            "PROMPT_SUBST"
        ];



        initContent = ''

            #zkratka pro git
            save() {
            git add .
            git commit -m "$*"
            }

            upgrade() {
                nix flake update
                sudo nixos-rebuild switch --flake ~/nixos-config#$(hostname)
            }

            tmp() {
                nix shell "nixpkgs#$1"
            }

            garbage() {
                echo "🗑️  Collecting old generations..."
                sudo nix-collect-garbage --delete-older-than 14d

                echo "📦 Optimizing store..."
                sudo nix store optimise

                echo "✅ Done."
            }

            nuke() {
                sudo nix-collect-garbage -d
                sudo nix store optimise
            }

            
            fastfetch

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