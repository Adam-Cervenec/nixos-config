{ config, pkgs, cfg, lib, ... }:

let
  cfgSteam = cfg.profile.steam or {};
in
lib.mkIf (cfgSteam.enable or false) {
    # --- Steam ---

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;


    programs.gamemode.enable = true;

}