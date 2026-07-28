{ lib, cfg, ... }:
let
    cfgSsh = cfg.profile.sshAgent or {};
in
lib.mkIf (cfgSsh.enable or false) {
    services.ssh-agent.enable = true;
}
