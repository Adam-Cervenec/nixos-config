{
    cfg,
    lib,
    ...
}:

let
    cfgEmbedded = cfg.profile.embedded or { };
    cfgUsername = cfg.machine.username;
in
lib.mkIf (cfgEmbedded.enable or false) {
    users.users.${cfgUsername}.extraGroups = [
        "dialout"
        "plugdev"
    ];
}
