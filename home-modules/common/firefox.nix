{ config, pkgs, device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.firefox or {};
in
lib.mkIf (cfg.enable or false) {
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";

    policies = {
      DisableTelemetry = true;
      DisablePocket = true;

      Homepage = {
        URL = "https://start.duckduckgo.com";
        StartPage = "homepage";
      };

      SearchEngines = {
        Default = "DuckDuckGo";
      };
    };
  };
}