{ config, pkgs, device, lib, ... }:

{
  imports =
    lib.optional (device.apps.browser == "firefox") ./firefox.nix
    ++ lib.optional (device.modules.git or false )./git.nix
    ++ lib.optional (device.modules.zsh or false ) ./zsh.nix
    ++ lib.optional (device.modules.stylix or false ) ./stylix.nix;

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
  ++ lib.optional (device.apps.browser != "firefox") pkgs.${device.apps.browser}
  ++ lib.optional (device.apps.terminal != "alacritty") pkgs.${device.apps.terminal};

  #due to stylix
  programs.alacritty = lib.mkIf (device.apps.terminal == "alacritty") {
    enable = true;
    settings = {};
  };

}