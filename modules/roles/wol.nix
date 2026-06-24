# modules/network/wol.nix

{ interface }:

{ pkgs, ... }:

{
  systemd.services.wol = {
    serviceConfig.ExecStart =
      "${pkgs.ethtool}/bin/ethtool -s ${interface} wol g";

    wantedBy = [ "multi-user.target" ];
  };
}