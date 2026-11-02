{ myHost, ... }:

let
    username = myHost.machine.username;
in
{
    users.users.${username} = {
        isNormalUser = true;
        description = username;

        extraGroups = [
            "networkmanager"
            "wheel"
        ];
    };
}
