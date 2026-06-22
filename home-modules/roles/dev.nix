{ config, pkgs, ... }:

{
    programs.vscode.enable = true;

    home.packages = with pkgs; [
        arduino
        nodejs
        gcc
    ];
}