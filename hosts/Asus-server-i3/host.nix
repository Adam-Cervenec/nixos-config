# host.nix
#
# this file declare host specific data
# and settings list, that this workstation
# will use

{
    machine = {
        # set the hostname for this workstation
        # hostname is coresponding with flake name
        # and should be unique for each workstation
        # and same as the host folder name
        hostname = "Asus-server-i3";
        username = "admin"; # set the username
        system = "x86_64-linux"; # system architecture

        # One of: desktop, laptop, server, vm
        device = "server";

        # Set a absolute path to your nixos-config folder
        nixosPath = "~/nixos-config";

        # Set to true if you want to use unfree packages
        unfreePkgs = true;
        homeVersion = "25.11"; # leave it
        stateVersion = "25.11"; # leave it
    };

    # Configuration layers applied to this host.
    # Select exactly one file from each category:
    #   - settings/profiles
    #   - settings/styles
    #   - settings/presets
    #
    # You can also create your own files in these directories.
    settings = [
        ../../settings/profiles/server.nix
    ];

    # Additional system roles to enable.
    # Roles are located in nixos/roles/system.
    # You can also create your own roles in this directory.
    roles.system = [

    ];

    # Additional home manager roles to enable.
    # Roles are located in nixos/roles/home.
    # You can also create your own roles in this directory.
    roles.home = [

    ];

    hardware = {
        # Enable every GPU present in this machine
        gpu.nvidia = false;
        gpu.amd = false;
        gpu.intel = false;

        # monitors configuration
        # hyprland format:
        # output, mode (resolution), position, scale (float)
        monitors = [
        ];

        # define which monitors will be used by waybar

        # needed for wol role, set the interface name for this machine
        network.interface = "";

        # ToDo: add this to Example host
        batteryPath = "/sys/class/power_supply/BAT0/charge_control_end_threshold";
        batteryLimit = 70;

    };
}
