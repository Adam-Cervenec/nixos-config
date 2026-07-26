{ config, pkgs, cfg, lib, ... }:

#define variable cfg for path
let
  firefox = cfg.profile.firefox or {};
in

# Enable Firefox if configured
lib.mkIf (firefox.enable or false) {
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/firefox";

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;

      SearchEngines = {
        Default = "DuckDuckGo";
      };
    };
  };
}