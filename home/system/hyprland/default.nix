# Hyprland is a dynamic tiling Wayland compositor that is highly customizable and performant.
{
  pkgs,
  config,
  lib,
  ...
}:
let
  border-size = config.theme.border-size;
  gaps-in = config.theme.gaps-in;
  gaps-out = config.theme.gaps-out;
  active-opacity = config.theme.active-opacity;
  inactive-opacity = config.theme.inactive-opacity;
  rounding = config.theme.rounding;
  blur = config.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
  background = "rgba(" + config.lib.stylix.colors.base00 + "EE)";
in
{
  imports = [
    ./animations.nix
    ./bindings.nix
    ./polkitagent.nix
  ];

  home.packages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    hyprland-qtutils
    adw-gtk3
    hyprshot
    hyprpicker
    swappy
    imv
    wf-recorder
    wlr-randr
    brightnessctl
    gnome-themes-extra
    libva
    dconf
    wayland-utils
    wayland-protocols
    glib
    direnv
    meson
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = false;
      variables = [
        "--all"
      ]; # https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/#programs-dont-work-in-systemd-services-but-do-on-the-terminal
    };
    package = null;
    portalPackage = null;

    settings = {
      exec-once = [ "dbus-update-activation-environment --systemd --all &" ];

      # monitorv2 = [
      #   {
      #     # DP-4 with HDR + your original mode/position/scale
      #     output = "DP-4";
      #     mode = "3840x2160@239.99";
      #     position = "0x0";
      #     scale = 1;
      #
      #     bitdepth = 10;
      #     vrr = 0;
      #
      #     cm = "hdredid";
      #     sdrbrightness = 1.2;
      #     sdrsaturation = 1;
      #     supports_wide_color = 0;
      #     supports_hdr = 0;
      #     sdr_min_luminance = 5.0e-3;
      #     sdr_max_luminance = 200;
      #     min_luminance = 0.0;
      #     max_luminance = 570;
      #     max_avg_luminance = 275;
      #   }
      #
      #   {
      #     # DP-6, converted from your old line:
      #     # "DP-6, highrr, -2160x-1300, 1, transform, 3, bitdepth, 10"
      #     output = "DP-6";
      #     mode = "highrr";
      #     position = "-2160x-1300";
      #     scale = 1;
      #     transform = 3;
      #     bitdepth = 10;
      #
      #     vrr = 0;
      #
      #     cm = "hdredid";
      #     sdrbrightness = 1.2;
      #     sdrsaturation = 1;
      #     supports_wide_color = 0;
      #     supports_hdr = 0;
      #     sdr_min_luminance = 5.0e-3;
      #     sdr_max_luminance = 200;
      #     min_luminance = 0.0;
      #     max_luminance = 570;
      #     max_avg_luminance = 275;
      #   }
      # ];

      monitor = [
        # ", preferred, auto, 1"
        "DP-4, 3840x2160@239.99, 0x0, 1, bitdepth, 10, cm, wide"
        "DP-6, highrr, -2160x-1300, 1, transform, 3, bitdepth, 10, cm, wide"
      ];

      # src: https://www.reddit.com/r/hyprland/comments/1i8cqgt/games_lagging_only_when_moving_mouse/
      # To fix micro stuttering in games
      render = {
        direct_scanout = 1;
        cm_fs_passthrough = 1;
        cm_auto_hdr = 2;
      };

      # assign workspaces to certain monitors
      # ensures that navigating to a certain workspace opens it on the correct monitor
      workspace = [
        "1, monitor:DP-4"
        "3, monitor:DP-4"
        "4, monitor:DP-4"
        "5, monitor:DP-4"
        "2, monitor:DP-6"
        "9, monitor:DP-6"
        "8, monitor:DP-6"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "MOZ_ENABLE_WAYLAND,1"
        "ANKI_WAYLAND,1"
        "DISABLE_QT5_COMPAT,0"
        "NIXOS_OZONE_WL,1"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM=wayland,xcb"
        "QT_QPA_PLATFORMTHEME=gtk3"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "__GL_GSYNC_ALLOWED,0"
        "__GL_VRR_ALLOWED,0"
        "DISABLE_QT5_COMPAT,0"
        "DIRENV_LOG_FORMAT,"
        "WLR_DRM_NO_ATOMIC,1"
        "WLR_BACKEND,vulkan"
        "WLR_RENDERER,vulkan"
        "WLR_NO_HARDWARE_CURSORS,1"
        "SDL_VIDEODRIVER,wayland, x11, windows"
        "CLUTTER_BACKEND,wayland"
      ];

      cursor = {
        no_hardware_cursors = true;
        default_monitor = "DP-4";
      };

      general = {
        resize_on_border = true;
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        layout = "dwindle";
        "col.inactive_border" = lib.mkForce background;
      };

      decoration = {
        active_opacity = active-opacity;
        inactive_opacity = inactive-opacity;
        rounding = rounding;
        shadow = {
          enabled = true;
          range = 20;
          render_power = 3;
        };
        blur = {
          enabled = if blur then "true" else "false";
          size = 18;
        };
      };

      master = {
        new_status = true;
        allow_small_split = true;
        mfact = 0.5;
      };

      gesture = "3, horizontal, workspace";

      windowrule = [
        "match:class proton-authenticator, float on"
        "match:class proton-authenticator, suppress_event maximize"
        "match:class proton-authenticator, center on"
        "match:class proton-authenticator, size 500 400"
        "match:class protonvpn-app, float on"
        "match:class protonvpn-app, center on"
        "match:class protonvpn-app, size 500 400"

        # MY WINDOW RULES

        # make Firefox/Zen PiP window floating and sticky
        "float on, match:title ^(Picture-in-Picture)$"
        "pin on, match:title ^(Picture-in-Picture)$"
        "opacity 1.0 1.0 override, match:title ^(Picture-in-Picture)$"

        # make Brave PiP window floating and sticky
        "float on, match:title ^(Picture in picture)$"
        "pin on, match:title ^(Picture in picture)$"
        "opacity 1.0 1.0 override, match:title ^(Picture in picture)$"

        # disable opacity in youtube
        "opacity 1.0 1.0 override, match:title .*- YouTube.*"
        "opacity 1.0 1.0 override, match:class ^(net-runelite-client-RuneLite)$"
        "float on, match:class ^(net-runelite-client-RuneLite)$"
        "size 1200 850, match:class ^(net-runelite-client-RuneLite)$"

        # add blur for ghostty
        "no_blur on, match:class ghostty"
      ];

      misc = {
        vfr = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        disable_autoreload = true;
        focus_on_activate = true;
      };

      input = {
        kb_layout = keyboardLayout;

        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0.5;
        repeat_delay = 300;
        repeat_rate = 50;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };
      };
    };
  };
}
