{ config, pkgs, device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.firefox or {};
in
lib.mkIf (cfg.enable or false) {
  programs.firefox = {
    enable = true;
    configPath = cfg.configPath;

    policies = {
      DisableTelemetry = cfg.disableTelemetry or true;
      DisablePocket = cfg.disableTelemetry or true;

      SearchEngines = {
        Default = cfg.defaultSearchEngine or "DuckDuckGo";
      };
    };
  };
}