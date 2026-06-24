{ config, pkgs, ... }:

{
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