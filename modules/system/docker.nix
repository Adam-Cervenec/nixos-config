{ myHost, ... }:

let
    username = myHost.machine.username;
in
{
    virtualisation.docker.enable = true;

    users.users.${username}.extraGroups = [
        "docker"
        "dialout"
        "uucp"
    ];
}
