{ lib, device, ... }:

let
  mod = device.modules.hyprland.keybindings.mod;
  size = device.modules.hyprland.keybindings.resizeSize;

  browser = device.apps.default.browser;
  terminal = device.apps.default.terminal;
  fileManager = device.apps.default.fileManager;
  codeEditor = device.apps.default.codeEditorCommand;
  notes = device.apps.default.notes;

  inherit (lib) genList;

  workspaceBinds =
    genList
      (i:
        "${mod}, code:${toString (i + 10)}, workspace, ${toString (i + 1)}"
      )
      10;

  moveWorkspaceBinds =
    genList
      (i:
        "${mod} SHIFT, code:${toString (i + 10)}, movetoworkspace, ${toString (i + 1)}"
      )
      10;
in
{
  wayland.windowManager.hyprland.settings = {

    bind = [

      # terminal

      "${mod}, return, exec, uwsm app -- ${terminal}"


      # operations

      "${mod}, Q, killactive,"
      "${mod}, F, fullscreen"
      "${mod}, T, togglefloating"
      "${mod}, P, pseudo,"
      "${mod} SHIFT, R, exec, hyprctl reload"


      # utils

      "${mod} SHIFT, S, exec, hyprshot -m region --clipboard-only -s"


      # windows

      "${mod}, H, movefocus, l"
      "${mod}, L, movefocus, r"
      "${mod}, K, movefocus, u"
      "${mod}, J, movefocus, d"

      "${mod} SHIFT, H, movewindow, l"
      "${mod} SHIFT, L, movewindow, r"
      "${mod} SHIFT, K, movewindow, u"
      "${mod} SHIFT, J, movewindow, d"


      # worspaces

      "${mod}, comma, workspace, -1"
      "${mod}, period, workspace, +1"

      "${mod} SHIFT, comma, movetoworkspace, -1"
      "${mod} SHIFT, period, movetoworkspace, +1"

      "${mod}, mouse_down, workspace, +1"
      "${mod}, mouse_up, workspace, -1"

      "${mod} SHIFT, mouse_down, movetoworkspace, +1"
      "${mod} SHIFT, mouse_up, movetoworkspace, -1"

    ]
    ++ workspaceBinds
    ++ moveWorkspaceBinds;

    binde = [      
      "${mod} CTRL, H, resizeactive, -${size} 0"
      "${mod} CTRL, L, resizeactive, ${size} 0"
      "${mod} CTRL, K, resizeactive, 0 -${size}"
      "${mod} CTRL, J, resizeactive, 0 ${size}"
    ];

    bindm = [
      "${mod}, mouse:272, movewindow"
      "${mod}, mouse:273, resizewindow"
    ];

    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
  };

  wayland.windowManager.hyprland.extraConfig =
    ''

      bind = ${mod}, A, submap, apps

      submap = apps

        bind = , A, exec, uwsm app -- ${terminal}
        bind = , W, exec, uwsm app -- ${browser}
        bind = , O, exec, uwsm app -- ${notes}
        bind = , C, exec, uwsm app -- ${codeEditor}
        bind = , E, exec, uwsm app -- ${fileManager}

        bind = , SPACE, submap, reset
        bind = , escape, submap, reset

      submap = reset

    '';
}
