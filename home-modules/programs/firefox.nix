{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

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

      profiles.default = {
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
    };
  };
}