{ config, pkgs, cfg, ... }:

let
  cfgStylix = cfgStean.steam or {};
in
lib.mkIf (cfgStean.enable or false) {
    # --- Steam ---

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;


    programs.gamemode.enable = true;

}