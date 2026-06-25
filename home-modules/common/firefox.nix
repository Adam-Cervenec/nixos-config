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
      DisableTelemetry = cfg.disableTelemetry;
      DisablePocket = cfg.disableTelemetry;

      Homepage = {
        URL = cfg.homePageURL;
        StartPage = "homepage";
      };

      SearchEngines = {
        Default = cfg.defaultSearchEngie;
      };
    };
  };
}