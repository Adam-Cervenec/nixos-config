{ config, pkgs, device, lib, inputs, ... }:

#define variable cfg for path
let
  cfg = device.modules.zen or {};
in
lib.mkIf (cfg.enable or false) {
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