# host.nix
#
# this file declare HW specific data
# and settings list, that this workstation
# will use

{
  machine = {
    hostname = "MainDesktop";
    username = "adam";
    system = "x86_64-linux";
    # for device option use "desktop", "laptop"
    # "server" or "vm"
    device = "desktop";
    unfreePkgs = true;
    homeVersion = "25.11";
  };

  settings = [
    ../../settings/profiles/adam.nix
    ../../settings/styles/flexoki-dark.nix
    ../../settings/presets/workstation.nix
  ];

  roles.system = [
    ./default.nix
  ];

  roles.home = [
    ./default.nix
  ];

  hardware = {
    gpu.nvidia = true;
    gpu.amd = false;
    gpu.intel = false;

    monitors = [
      "HDMI-A-1,preferred,0x0,1"
      "DP-3,preferred,1920x0,1"
    ];

    waybar.monitors = ["HDMI-A-1"];

    network.interface = "enp37s0";
  };
}