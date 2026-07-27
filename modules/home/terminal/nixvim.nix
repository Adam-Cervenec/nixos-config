{ cfg, lib, ...}:

let
  cfgNixvim = cfg.profile.nixvim or {};
in

lib.mkIf (cfgNixvim.enable or false) {
  programs.nixvim = {
    enable = true;
    opts = {
      # print the line number in front of each line 
      number = true;

      # show relative line number in front of each line
      relativenumber = true;

      # <TAB> settings
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;

      # automatic formatting
      smartindent = true;
      smartcase = true;
      smarttab = true;

      # minimal number of screen lines to keep above and below the cursor
      scrolloff = 5;
    };
  };

}