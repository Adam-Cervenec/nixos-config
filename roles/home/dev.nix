{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        arduino
        nodejs
        gcc
    ];
}