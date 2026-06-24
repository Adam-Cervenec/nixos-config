#home.nix

{ config, pkgs, ... }:

{


  #allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home-modules/common.nix

    ../../home-modules/roles/dev.nix
    ../../home-modules/roles/3d-printing.nix
    ../../home-modules/roles/games.nix
    ../../home-modules/roles/office.nix
    ../../home-modules/roles/utils.nix

    
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;



# --- Deklarace SW ---

  home.packages = with pkgs; [

  ];

}
