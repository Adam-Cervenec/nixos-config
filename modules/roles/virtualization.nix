{ device, ... }:

{
  virtualisation.libvirtd.enable = true;

  programs.virt-manager.enable = true;

  users.users.${device.machine.username}.extraGroups = [
    "libvirtd"
  ];

  virtualisation.spiceUSBRedirection.enable = true;
}