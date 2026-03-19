{ config, pkgs, ... }:

{
    # --- SW ---

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [ 
        
    ];


    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # --- Steam ---

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;


    programs.gamemode.enable = true;

}