{
    cfg,
    ...
}:

let
    cfgUsername = cfg.machine.username;
in
{
    users.users.${cfgUsername}.extraGroups = [
        "dialout"
        "plugdev"
    ];
}
