{ inputs, ... }:

{
    wayland.windowManager.hyprland.extraLuaFiles = {
        "hyprsplit/init" = {
            autoLoad = false;
            content = builtins.readFile "${inputs.hyprsplit.hyprsplitlua}/share/hyprsplit/init.lua";
        };

        "hyprsplit" = {
            autoLoad = true;

            content = ''
                local hs = require("hyprsplit")

                hs.config({
                    num_workspaces = 5,
                    persistent_workspaces = false,
                })
            '';
        };
    };
}
