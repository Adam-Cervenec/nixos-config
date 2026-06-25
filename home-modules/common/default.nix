{ config, pkgs, device, lib, ... }:

#define variables for paths in device.nix
let
  inherit (device) apps modules ;
in
{
  imports =
    lib.optional (apps.browser == "firefox") ./firefox.nix
    ++ lib.optional (apps.codeEditor == "vscode") ./vscode.nix
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
  ++ lib.optional (apps.browser != "firefox") pkgs.${apps.browser}
  ++ lib.optional (apps.codeEditor != "vscode") pkgs.${apps.codeEditor}
  ++ lib.optional (apps.terminal != "alacritty") pkgs.${apps.terminal};

  #due to stylix
  programs.alacritty = lib.mkIf (apps.terminal == "alacritty") {
    enable = true;
    settings = {};
  };

}