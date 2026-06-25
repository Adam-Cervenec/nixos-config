{ lib, pkgs, device, ... }:

#define variables for paths in device.nix
let
  cfg = device.hardware.network or {};
in

lib.mkIf (cfg.wol.enable or false) {

  systemd.services.wol = {
    description = "Enable Wake-on-LAN";

    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart =
        "${pkgs.ethtool}/bin/ethtool -s ${cfg.interface} wol g";
    };
  };

}