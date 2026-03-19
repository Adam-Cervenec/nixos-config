{ config, pkgs, ... }:

{
    # --- SW ---

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [ 
        
    ];


    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

}