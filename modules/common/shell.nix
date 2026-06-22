{ config, pkgs, ... }:

{

    users.users.user.shell = pkgs.zsh;
    programs.zsh.enable = true;

}