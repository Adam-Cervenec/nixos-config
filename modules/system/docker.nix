{ cfg, config, lib, ... }:

let
  cfgDocker = cfg.profile.docker or {};
  username = cfg.machine.username;
in
lib.mkIf (cfgDocker.enable or false){
   virtualisation.docker.enable = true;

   users.users.${username}.extraGroups = [ "docker" ];
}
