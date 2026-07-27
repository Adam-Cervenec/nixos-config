{ config, pkgs, cfg, ... }:
let
    stateVersion = cfg.machine.stateVersion;
    unfreePkgs = cfg.machine.unfreePkgs;
    sudoCfg = cfg.profile.sudo;
in
{
    # --- System ---

    #experimental
    nix.settings.experimental-features = [ "nix-command" "flakes" ];


    #allow unfree packages
    nixpkgs.config.allowUnfree = unfreePkgs;

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


    # --- OS version ---

    system.stateVersion = stateVersion; # Did you read the comment?


    # --- Firewall ---

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];

    networking.firewall.enable = true; 

    # sudo settings
    security.sudo.extraConfig = ''
        Defaults timestamp_type=${sudoCfg.timestampType or "tty"}
        Defaults timestamp_timeout=${toString (sudoCfg.logoutDuration or 120)}
    '';
}
