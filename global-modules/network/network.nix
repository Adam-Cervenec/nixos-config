{ config, pkgs, ... }:

{
    # --- Network ---

    networking.hostName = "nixos"; # Define your hostname.

    # Enable networking
    networking.networkmanager = {
        enable = true;
        dns = "dnsmasq";
    };

    # due to steam low speed download
    services.dnsmasq = {
        enable = true;

        settings = {
        "listen-address" = "127.0.0.1";
        "no-resolv"      = true;
        "port"           = 0;
        "server"         = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];
        };
    };
}