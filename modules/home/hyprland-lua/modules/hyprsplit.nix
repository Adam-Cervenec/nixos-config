{ inputs, pkgs, ... }:
{
    wayland.windowManager.hyprland.extraLuaFiles = {
        "hyprsplit/init" = {
            autoLoad = false;
            content = builtins.readFile "${
                inputs.hyprsplit.packages.${pkgs.system}.hyprsplitlua
            }/share/hyprsplit/init.lua";
        };

        "hyprload" = {
            autoLoad = true;
            content = ''
                local hs = require("hyprsplit")

                hs.config({
                  num_workspaces = 10,
                  persistent_workspaces = false,
                })
            '';
        };
    };
}
