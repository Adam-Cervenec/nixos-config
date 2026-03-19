{ config, pkgs, ... }:

{
    # --- System ---

    #experimental
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;


    # Set your time zone.
    time.timeZone = "Europe/Prague";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "cs_CZ.UTF-8";
        LC_IDENTIFICATION = "cs_CZ.UTF-8";
        LC_MEASUREMENT = "cs_CZ.UTF-8";
        LC_MONETARY = "cs_CZ.UTF-8";
        LC_NAME = "cs_CZ.UTF-8";
        LC_NUMERIC = "cs_CZ.UTF-8";
        LC_PAPER = "cs_CZ.UTF-8";
        LC_TELEPHONE = "cs_CZ.UTF-8";
        LC_TIME = "cs_CZ.UTF-8";
    };

    # --- user ---
    users.users.user = {
        isNormalUser = true;
        description = "user";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        kdePackages.kate
        ];

    };

    users.users.user.shell = pkgs.zsh;
    programs.zsh.enable = true;


    # --- OS version ---

    system.stateVersion = "25.11"; # Did you read the comment?
}