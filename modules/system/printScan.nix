{ cfg, lib, pkgs, ...}:
let
    cfgPrintScan = cfg.profile.printScan or {};
    cfgUser = cfg.machine.username;
in
lib.mkIf (cfgPrintScan.enable or false)
{
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  hardware.sane.enable = true;

  users.users.${cfgUser}.extraGroups = [
    "scanner"
    "lp"
  ];
  environment.systemPackages = with pkgs; [
    simple-scan # GUI app for scaning
    system-config-printer # GUI app for configuring printers
  ];
}
