{ config, lib, pkgs, cfg, ... }:

lib.mkIf (cfg.profile.sddm.enable or false) {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = false;
}