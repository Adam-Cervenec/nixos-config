{
    config,
    cfg,
    lib,
    ...
}:

let
    cfgBatteryPath = cfg.hardware.batteryPath or { };
    cfgBatteryLimit = cfg.hardware.batteryLimit or { };
in
{
    # let the laptop always on even if the lid is closed
    services.logind = {
        lidSwitch = "ignore";
        lidSwitchDocked = "ignore";
        lidSwitchExternalPower = "ignore";
    };

    # Battery charge to var battery limit%
    # For the health of battery
    systemd.services.battery-charge-limit = {
        description = "Set battery charge limit";
        wantedBy = [ "multi-user.target" ];
        after = [ "multi-user.target" ];
        script = ''
            if [ -f ${cfgBatteryPath} ]; then
                echo ${cfgBatteryLimit} > ${cfgBatteryPath}
            fi
        '';
        serviceConfig = {
            Type = "oneshot";
        };
    };

    boot.kernelParams = [ "consoleblank=60" ];
}
