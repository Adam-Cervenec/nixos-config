{ cfg, ... }:

let
    username = cfg.machine.username;
in
{
    virtualisation.docker.enable = true;

    users.users.${username}.extraGroups = [
        "docker"
        "dialout"
        "uucp"
    ];
}
