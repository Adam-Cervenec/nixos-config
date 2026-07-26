{ cfg, config, pkgs, lib, ... }:

lib.mkIf (cfg.hardware.nvidia.enable or false) {
    # --- nVidia GPU drivers and settings  ---
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = false;
        nvidiaSettings = true;
    };
}