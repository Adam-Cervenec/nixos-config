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
      "${mod} SHIFT, F, togglefloating"
      "${mod}, P, pseudo,"
      "${mod} SHIFT, R, exec, hyprctl reload"


      "${mod}, W, exec, uwsm app -- hyprlauncher"


      # submaps definitions

      "${mod}, V, submap, Volume"
      "${mod}, A, submap, Apps"
      "${mod}, S, submap, System"


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

  wayland.windowManager.hyprland.submaps = {
    Volume.settings.binde = [
      ", U, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
      ", D, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%-"
      ", comma, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 1%-"
      ", period, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 1%+"

      "SHIFT, U, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+"
      "SHIFT, D, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 5%-"
      "SHIFT, comma, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 1%-"
      "SHIFT, period, exec, wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SOURCE@ 1%+"
    ];
    Volume.settings.bind = [
      ", M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      "SHIFT, M, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ", H, exec, playerctl previous"
      ", J, exec, playerctl play-pause"
      ", K, exec, playerctl stop"
      ", L, exec, playerctl next"

      ", escape, submap, reset"
      ", SPACE, submap, reset"
    ];

    Apps.settings.bind = [
      ", A, exec, uwsm app -- ${terminal}"
      ", F, exec, uwsm app -- ${browser}"
      ", O, exec, uwsm app -- ${notes}"
      ", C, exec, uwsm app -- ${codeEditor}"
      ", E, exec, uwsm app -- ${fileManager}"

      ", escape, submap, reset"
      ", SPACE, submap, reset"
    ];

    System.onDispatch = "reset";
    System.settings.bind = [
      ", C, exec, uwsm app -- copyq toggle"
      ", S, exec, uwsm app -- hyprshot -m region --clipboard-only -s"
      ", V, exec, uwsm app -- hyprpwcenter"
      ", N, exec, uwsm app -- nm-connection-editor"
      ", L, exec, uwsm app -- hyprlock"
      ", Q, exec, uwsm app -- hyprshutdown"
      
      ", catchall, submap, reset"
    ];
  };
}
