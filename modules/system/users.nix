{ cfg, ... }:

let
    username = cfg.machine.username;
in
{
  users.users.${username} = {
    isNormalUser = true;
    description = username;

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}