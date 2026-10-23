{ config, pkgs, cfg, ... }:
let
    username = cfg.machine.username;
in

{
    users.users.${username}.shell = pkgs.zsh;
    programs.zsh.enable = true;
}