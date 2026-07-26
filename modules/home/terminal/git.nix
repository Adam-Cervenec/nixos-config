{ lib, cfg, ... }:

#define variable cfg for path
let
  cfgGit = cfg.profile.git or {};
in

#if git is enabled, define git...
lib.mkIf (cfgGit.enable or false) {

  programs.git = {
    enable = true;

    settings = {
      user.name = cfgGit.username;
      user.email = cfgGit.email;
    };
  };

}