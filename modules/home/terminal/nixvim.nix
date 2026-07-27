{ cfg, lib, ...}:

let
  cfgNixvim = cfg.profile.nixvim or {};
in

lib.mkIf (cfgNixvim.enable or false) {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
  };

}