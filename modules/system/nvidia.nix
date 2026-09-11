{
    cfg,
    config,
    pkgs,
    lib,
    ...
}:

lib.mkIf (cfg.hardware.gpu.nvidia or false) {
    # --- nVidia GPU drivers and settings  ---
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        open = true;
        nvidiaSettings = true;
    };
}
