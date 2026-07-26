{ lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.git or {};
in

#if git is enabled, define git...
lib.mkIf (cfg.enable or false) {

  programs.git = {
    enable = true;

    settings = {
      user.name = cfg.username;
      user.email = cfg.email;
    };
  };

}