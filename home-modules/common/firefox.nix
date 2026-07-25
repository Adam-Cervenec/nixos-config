{ config, pkgs, device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.firefox or {};
in

# Enable Firefox if configured
lib.mkIf (cfg.enable or false) {
  programs.firefox = {
    enable = true;
    configPath = cfg.configPath or "${config.xdg.configHome}/firefox";

    policies = {
      DisableTelemetry = cfg.DisableTelemetry or true;
      DisablePocket = cfg.DisablePocket or true;

      SearchEngines = {
        Default = cfg.SearchEngines.Default or "DuckDuckGo";
      };
    };
  };
}