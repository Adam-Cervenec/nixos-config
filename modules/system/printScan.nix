{ cfg, lib, ...}:
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
    simple-scan
    system-config-printer
  ];
}
