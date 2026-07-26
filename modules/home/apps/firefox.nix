{ config, pkgs, cfg, lib, ... }:

#define variable cfg for path
let
  cfgFirefox = cfg.profile.firefox or {};
in

# Enable Firefox if configured
lib.mkIf (cfgFirefox.enable or false) {
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