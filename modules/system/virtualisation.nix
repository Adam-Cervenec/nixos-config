{ cfg, lib, ... }:
let
  username = cfg.machine.username;
  cfgVirt = cfg.profile.virtualisation or {};
in
lib.mkIf (cfgVirt.enable or false) {
  virtualisation.libvirtd.enable = true;

  programs.virt-manager.enable = true;

  users.users.${username}.extraGroups = [
    "libvirtd"
  ];

  virtualisation.spiceUSBRedirection.enable = true;
}