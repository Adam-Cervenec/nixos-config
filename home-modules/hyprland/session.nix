{ device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{
  wayland.windowManager.hyprland.settings = {

    monitor = cfg.monitors;


    env = [

      # Applications
      "MOZ_ENABLE_WAYLAND=1"
      "ELECTRON_OZONE_PLATFORM_HINT=auto"

      # Wayland / Qt
      "GDK_BACKEND=wayland"
      "QT_QPA_PLATFORM=wayland;xcb"

      # Misc
      "STEAM_FORCE_DESKTOPUI_SCALING=0"
    ]
    ++ lib.optionals (device.hardware.gpu == "nvidia") [
      # NVIDIA
      "LIBVA_DRIVER_NAME=nvidia"
      "__GLX_VENDOR_LIBRARY_NAME=nvidia"
      "GBM_BACKEND=nvidia-drm"
      "renderer=nvidia"
      "NVD_BACKEND=direct"

      # Vulkan
      "__NV_PRIME_RENDER_OFFLOAD=1"
      "__VK_LAYER_NV_optimus=NVIDIA_only"
      "VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json"
      "VK_LAYER_PATH=/usr/share/vulkan/explicit_layer.d"
      "__EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json"
    ];


    input = {
      kb_layout = "us,cz";
      kb_variant = ",qwerty";
      kb_options = "grp:win_space_toggle";

      follow_mouse = 1;
      sensitivity = 0.5;

      touchpad = {
        natural_scroll = false;
      };
    };

    # Per-device overrides
    # device = {
    #   name = "epic-mouse-v1";
    #   sensitivity = -0.7;
    # };

    # Laptop gestures
    # gestures = {
    #   workspace_swipe = false;
    # };
  };
}