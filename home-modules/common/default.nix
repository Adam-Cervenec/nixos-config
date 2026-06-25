{ config, pkgs, device, lib, ... }:

#define variables for paths in device.nix
let
  inherit (device) apps modules ;
in
{
  imports =
    lib.optional (apps.default.browser == "firefox") ./firefox.nix
    ++ lib.optional (apps.default.codeEditor == "vscode") ./vscode.nix
    ++ lib.optional (modules.git.enable or false )./git.nix
    ++ lib.optional (modules.zsh.enable or false ) ./zsh.nix
    ++ lib.optional (modules.stylix.enable or false ) ./stylix.nix;

  home.packages = with pkgs; [
    #browser

    #thunar
    ntfs3g
    thunar
    thunar-volman

    #terminal + utils
    fastfetch
    btop

    #torrent client
    qbittorrent


    #notes
    obsidian
  ]
  ++ lib.optional (apps.default.browser != "firefox") pkgs.${apps.default.browser}
  ++ lib.optional (apps.default.codeEditor != "vscode") pkgs.${apps.default.codeEditor}
  ++ lib.optional (apps.default.terminal != "alacritty") pkgs.${apps.default.terminal};

  #due to stylix
  programs.alacritty = lib.mkIf (apps.default.terminal == "alacritty") {
    enable = true;
    settings = {};
  };

}