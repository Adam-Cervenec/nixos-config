{
    config,
    pkgs,
    myHost,
    ...
}:
let
    username = myHost.machine.username;
in

{
    users.users.${username}.shell = pkgs.zsh;
    programs.zsh.enable = true;
}
