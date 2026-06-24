{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      ms-vscode.cpptools-extension-pack

      platformio.platformio-vscode-ide

      formulahendry.code-runner

      bradlc.vscode-tailwindcss

      jnoortheen.nix-ide
    ];
  };
}