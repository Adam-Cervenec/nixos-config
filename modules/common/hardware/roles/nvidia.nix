{ config, pkgs, ... }:

{
    # --- nVidia GPU drivers and settings  ---
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = false;
        nvidiaSettings = true;
    };
}