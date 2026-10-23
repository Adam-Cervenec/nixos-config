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
        hostname = "Asus-A16";
        username = "user"; # set the username
        system = "x86_64-linux"; # system architecture

        # One of: desktop, laptop, server, vm
        device = "laptop";

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
        ../../settings/profiles/adam.nix
        ../../settings/styles/flexoki-dark.nix
        ../../settings/presets/workstation.nix
    ];

    # Additional system roles to enable.
    # Roles are located in nixos/roles/system.
    # You can also create your own roles in this directory.
    roles.system = [
        "asusRog"

    ];

    # Additional home manager roles to enable.
    # Roles are located in nixos/roles/home.
    # You can also create your own roles in this directory.
    roles.home = [

        "laptop"
    ];

    hardware = {
        # Enable every GPU present in this machine
        gpu.nvidia = true;
        gpu.amd = false;
        gpu.intel = false;

        bluetooth = true;

        # monitors configuration
        # hyprland format:
        # output, mode (resolution), position, scale (float)
        monitors = [
            "eDP-1,preferred,0x0,1.25"
            "eDP-2,preferred,0x0,1.25"
            # "HDMI-A-1, 2560x1440@144.01, auto, 1.25" # monitor in Brno
        ];

        # define which monitors will be used by waybar
        waybar.monitors = [
            "eDP-1"
            "eDP-2"
        ];

        # needed for wol role, set the interface name for this machine
        network.interface = "wlp4s0";
    };
}
