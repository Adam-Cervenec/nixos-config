{ config, pkgs, cfg, lib, inputs, ... }:

#define variable cfg for path
let
  cfgZen = cfg.profile.zen or {};
in
lib.mkIf (cfgZen.enable or false) {
  home.packages = [
    (pkgs.wrapFirefox
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser-unwrapped
      {
        extraPolicies = {
          DisableTelemetry = cfg.disableTelemetry or true;
          DisablePocket = cfg.disableTelemetry or true;
        };
      })
  ];
}