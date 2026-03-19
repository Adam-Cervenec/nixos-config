{ config, pkgs, ... }:

{
    # --- Firewall ---

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];

    networking.firewall.enable = true; 
}