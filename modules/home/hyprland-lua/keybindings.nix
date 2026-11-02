{ lib, myHost, ... }:

let
    mod = myHost.profile.hyprland.modKey;

    browser = myHost.profile.apps.default.browser;
    terminal = myHost.profile.apps.default.terminal;
    fileManager = myHost.profile.apps.default.fileManager;
    codeEditor = myHost.profile.apps.default.codeEditorCommand;
    notes = myHost.profile.apps.default.notes;

    inherit (lib) genList;

    # Lua helpers
    lua = lib.generators.mkLuaInline;

    exec = command: "hl.dsp.exec_cmd(${builtins.toJSON command})";

    luaFlags =
        flags:
        "{ "
        + lib.concatStringsSep ", " (
            lib.mapAttrsToList (name: value: "${name} = ${if value then "true" else "false"}") flags
        )
        + " }";

    # Every binding is generated through hl.bind(keys, dispatcher, flags).
    mkBind = keys: dispatcher: flags: {
        _args = [
            keys
            (lua dispatcher)
        ]
        ++ lib.optional (flags != { }) [
            (lua (luaFlags flags))
        ];
    };

    bind = keys: dispatcher: mkBind keys dispatcher { };

    bindRepeat =
        keys: dispatcher:
        mkBind keys dispatcher {
            repeating = true;
        };

    bindLocked =
        keys: dispatcher:
        mkBind keys dispatcher {
            locked = true;
        };

    bindLockedRepeat =
        keys: dispatcher:
        mkBind keys dispatcher {
            locked = true;
            repeating = true;
        };

    bindMouse =
        keys: dispatcher:
        mkBind keys dispatcher {
            mouse = true;
        };

    # Workspaces
    workspaceBinds = genList (
        i: bind "${mod} + code:${toString (i + 10)}" "${hs}.dsp.focus({ workspace = ${toString (i + 1)} })"
    ) 10;

    moveWorkspaceBinds = genList (
        i:
        bind "${mod} + SHIFT + code:${toString (i + 10)}" "${hs}.dsp.window.move({ workspace = ${toString (i + 1)}, follow = false })"
    ) 10;

    hs = ''require("hyprsplit")'';

    # Resize windows
    resizeBinds = [
        (bindRepeat "${mod} + CTRL + H" "hl.dsp.window.resize({ x = -15, y = 0, relative = true })")

        (bindRepeat "${mod} + CTRL + L" "hl.dsp.window.resize({ x = 15, y = 0, relative = true })")

        (bindRepeat "${mod} + CTRL + K" "hl.dsp.window.resize({ x = 0, y = -15, relative = true })")

        (bindRepeat "${mod} + CTRL + J" "hl.dsp.window.resize({ x = 0, y = 15, relative = true })")
    ];

    # Mouse binds
    mouseBinds = [
        (bindMouse "${mod} + mouse:272" "hl.dsp.window.drag()")

        (bindMouse "${mod} + mouse:273" "hl.dsp.window.resize()")
    ];

    # Media controls
    mediaBinds = [
        (bindLocked "XF86AudioNext" (exec "playerctl next"))

        (bindLocked "XF86AudioPause" (exec "playerctl play-pause"))

        (bindLocked "XF86AudioPlay" (exec "playerctl play-pause"))

        (bindLocked "XF86AudioPrev" (exec "playerctl previous"))
    ];

    # Volume and brightness
    volumeBrightnessBinds = [
        (bindLockedRepeat "XF86AudioRaiseVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))

        (bindLockedRepeat "XF86AudioLowerVolume" (exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

        (bindLocked "XF86AudioMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

        (bindLocked "XF86AudioMicMute" (exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

        (bindLockedRepeat "XF86MonBrightnessUp" (exec "brightnessctl s 10%+"))

        (bindLockedRepeat "XF86MonBrightnessDown" (exec "brightnessctl s 10%-"))
    ];

    # Global bindings
    globalBinds = [
        # Terminal
        (bind "${mod} + RETURN" (exec "uwsm app -- ${terminal}"))

        # Operations
        (bind "${mod} + Q" "hl.dsp.window.kill()")

        (bind "${mod} + F" "hl.dsp.window.fullscreen({ action = \"toggle\" })")

        (bind "${mod} + SHIFT + F" "hl.dsp.window.float({ action = \"toggle\" })")

        (bind "${mod} + P" "hl.dsp.window.pseudo({ action = \"toggle\" })")

        #(bind "${mod} + SHIFT + R" "hl.dsp.reload_config()")

        # Submap definitions
        (bind "${mod} + V" "hl.dsp.submap(\"Volume\")")

        (bind "${mod} + A" "hl.dsp.submap(\"Apps\")")

        (bind "${mod} + S" "hl.dsp.submap(\"System\")")

        (bind "${mod} + R" "hl.dsp.submap(\"Rofi\")")

        # Window focus
        (bind "${mod} + H" "hl.dsp.focus({ direction = \"l\" })")

        (bind "${mod} + L" "hl.dsp.focus({ direction = \"r\" })")

        (bind "${mod} + K" "hl.dsp.focus({ direction = \"u\" })")

        (bind "${mod} + J" "hl.dsp.focus({ direction = \"d\" })")

        # Move windows
        (bind "${mod} + SHIFT + H" "hl.dsp.window.move({ direction = \"l\" })")

        (bind "${mod} + SHIFT + L" "hl.dsp.window.move({ direction = \"r\" })")

        (bind "${mod} + SHIFT + K" "hl.dsp.window.move({ direction = \"u\" })")

        (bind "${mod} + SHIFT + J" "hl.dsp.window.move({ direction = \"d\" })")

        # Workspaces
        (bind "${mod} + comma" "${hs}.dsp.focus({ workspace = \"-1\" })")

        (bind "${mod} + period" "${hs}.dsp.focus({ workspace = \"+1\" })")

        (bind "${mod} + SHIFT + comma" "${hs}.dsp.window.move({ workspace = \"-1\", follow = false })")

        (bind "${mod} + SHIFT + period" "${hs}.dsp.window.move({ workspace = \"+1\", follow = false })")

        (bind "${mod} + mouse_down" "${hs}.dsp.focus({ workspace = \"+1\" })")

        (bind "${mod} + mouse_up" "${hs}.dsp.focus({ workspace = \"-1\" })")

        (bind "${mod} + SHIFT + mouse_down" "${hs}.dsp.window.move({ workspace = \"+1\", follow = false })")

        (bind "${mod} + SHIFT + mouse_up" "${hs}.dsp.window.move({ workspace = \"-1\", follow = false })")
    ]
    ++ workspaceBinds
    ++ moveWorkspaceBinds
    ++ resizeBinds
    ++ mouseBinds
    ++ mediaBinds
    ++ volumeBrightnessBinds;

in
{
    wayland.windowManager.hyprland.settings = {
        # All global binds use the same Lua function.
        bind = globalBinds;
    };

    # Submaps
    wayland.windowManager.hyprland.submaps = {

        # Volume
        Volume.settings.bind = [
            (bindRepeat "U" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+"))

            (bindRepeat "D" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%-"))

            (bindRepeat "comma" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 1%-"))

            (bindRepeat "period" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 1%+"))

            (bindRepeat "SHIFT + U" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+"))

            (bindRepeat "SHIFT + D" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 5%-"))

            (bindRepeat "SHIFT + comma" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 1%-"))

            (bindRepeat "SHIFT + period" (exec "wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 1%+"))

            (bind "M" (exec "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

            (bind "SHIFT + M" (exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

            (bind "H" (exec "playerctl previous"))

            (bind "J" (exec "playerctl play-pause"))

            (bind "K" (exec "playerctl stop"))

            (bind "L" (exec "playerctl next"))

            (bind "escape" "hl.dsp.submap(\"reset\")")

            (bind "SPACE" "hl.dsp.submap(\"reset\")")
        ];

        # Apps
        Apps.settings.bind = [
            (bind "A" (exec "uwsm app -- ${terminal}"))
            (bind "F" (exec "uwsm app -- ${browser}"))
            (bind "O" (exec "uwsm app -- ${notes}"))
            (bind "C" (exec "uwsm app -- ${codeEditor}"))
            (bind "E" (exec "uwsm app -- ${fileManager}"))

            (bind "escape" "hl.dsp.submap(\"reset\")")
            (bind "SPACE" "hl.dsp.submap(\"reset\")")
        ];

        # System
        System = {
            onDispatch = "reset";

            settings.bind = [
                (bind "C" (exec "uwsm app -- copyq toggle"))
                (bind "S" (exec "uwsm app -- hyprshot -m region --clipboard-only -zs"))
                (bind "V" (exec "uwsm app -- hyprpwcenter"))
                (bind "N" (exec "uwsm app -- nm-connection-editor"))
                (bind "L" (exec "uwsm app -- hyprlock"))
                (bind "Q" (exec "uwsm app -- hyprshutdown"))

                (bind "catchall" "hl.dsp.submap(\"reset\")")
            ];
        };

        # Rofi
        Rofi = {
            onDispatch = "reset";

            settings.bind = [
                (bind "D" (exec "uwsm app -- rofi -show drun"))
                (bind "W" (exec "uwsm app -- rofi -show window"))
                (bind "R" (exec "uwsm app -- rofi -show run"))
                (bind "S" (exec "uwsm app -- rofi -show ssh"))
                (bind "C" (exec "uwsm app -- rofi -show calc"))

                (bind "catchall" "hl.dsp.submap(\"reset\")")
            ];
        };
    };
}
