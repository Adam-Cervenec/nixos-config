{
    pkgs,
    ...
}:

{
    # --- nVidia GPU drivers and settings  ---
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = true;
        nvidiaSettings = true;
    };

    environment.systemPackages = with pkgs; [
        lsof
    ];
}
