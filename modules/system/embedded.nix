{
    myHost,
    ...
}:

let
    username = myHost.machine.username;
in
{
    users.users.${username}.extraGroups = [
        "dialout"
        "plugdev"
    ];
}
