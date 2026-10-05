{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        openvpn
        networkmanager-openvpn
    ];

    services.openvpn.servers = {
        vut = {
            config = ''
                config ./fit.ovpn
            '';
            autoStart = false;
        };
    };
}
