#home.nix

{ config, pkgs, inputs, device, ... }:

{

  nixpkgs.config.allowUnfree = device.machine.unfreePkgs;

  imports = [
    ../../home-modules/common
    ../../home-modules/hyprland

    ../../home-modules/roles/dev.nix
    ../../home-modules/roles/3d-printing.nix
    ../../home-modules/roles/games.nix
    ../../home-modules/roles/office.nix
    ../../home-modules/roles/utils.nix
  ];

  home.username = device.machine.username;
  home.homeDirectory = "/home/${device.machine.username}";

  home.stateVersion = device.machine.homeVersion;

  programs.home-manager.enable = true;



# --- Deklarace SW ---

  home.packages = with pkgs; [

  ];

  
}
