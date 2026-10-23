{ cfg, pkgs, ... }:
let
    cfgUser = cfg.machine.username;
in
{
    services.printing.enable = true;
    services.printing.browsing = true;

    services.avahi = {
        enable = true;
        nssmdns4 = true;
    };

    hardware.sane.enable = true;
    hardware.sane.extraBackends = [
        pkgs.sane-airscan
    ];

    users.users.${cfgUser}.extraGroups = [
        "scanner"
        "lp"
    ];
    environment.systemPackages = with pkgs; [
        simple-scan # GUI app for scaning
        system-config-printer # GUI app for configuring printers
    ];
}
# Scan command example:
# scanimage --resolution 300 --format=png > image.png
