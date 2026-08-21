{
    lib,
    pkgs,
    cfg,
    ...
}:

#define variables for paths in device.nix
let
    cfgNetwork = cfg.hardware.network or { };
    cfgWol = cfg.profile.wol or { };
in

{
    systemd.services.wol = {
        description = "Enable Wake-on-LAN";

        wantedBy = [ "multi-user.target" ];

        serviceConfig = {
            Type = "oneshot";
            ExecStart = "${pkgs.ethtool}/bin/ethtool -s ${cfgNetwork.interface} wol g";
        };
    };

}
