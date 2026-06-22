{ config, pkgs, ... }:

{
    programs.vscode = {
        enable = true;

        extensions = with pkgs.vscode-extensions; [
            ms-vscode.cpptools
            ms-vscode.cpptools-extension-pack

            platformio.platformio-ide

            formulahendry.code-runner

            bradlc.vscode-tailwindcss
        ];
    };

    home.packages = with pkgs; [
        arduino
        nodejs
        gcc
    ];
}