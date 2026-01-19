{ lib, pkgs, config, ... }: {
  options.theme = lib.mkOption {
    type = lib.types.attrs;
    default = {
      rounding = 0;
      gaps-in = 5;
      gaps-out = 5 * 2;
      active-opacity = 0.96;
      inactive-opacity = 0.92;
      blur = true;
      border-size = 1;
      animation-speed = "fast"; # "fast" | "medium" | "slow"
      fetch = "nerdfetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"
      textColorOnWallpaper =
        config.lib.stylix.colors.base01; # Color of the text displayed on the wallpaper (Lockscreen, display manager, ...)
    };
    description = "Theme configuration options";
  };

  config.stylix = {
    enable = true;

    # See https://tinted-theming.github.io/tinted-gallery/ for more schemes
    base16Scheme = {
      base00 = "#000000";
      base01 = "#121212";
      base02 = "#222222";
      base03 = "#333333";
      base04 = "#999999";
      base05 = "#c1c1c1";
      base06 = "#999999";
      base07 = "#c1c1c1";
      base08 = "#5f8787";
      base09 = "#aaaaaa";
      base0A = "#79241f";
      base0B = "#f8f7f2";
      base0C = "#aaaaaa";
      base0D = "#888888";
      base0E = "#999999";
      base0F = "#444444";
    };

    cursor = {
      name = "phinger-cursors-light";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };
      sansSerif = {
        package = pkgs.source-sans-pro;
        name = "Source Sans Pro";
      };
      serif = config.stylix.fonts.sansSerif;
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 15;
        desktop = 15;
        popups = 15;
        terminal = 15;
      };
    };

    polarity = "dark";
    image = pkgs.fetchurl {
      # Neon sign
      # url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/staircase.jpg";
      # sha256 = "sha256-dUSrAjvFzkXr2Xb5/kPkS5fwB66CycPrB8CqcFGCycM=";
      # singularity
      # url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/planet_minimal.png";
      # sha256 = "sha256-dUSrAjvFzkXr2Xb5/kPkS5fwB66CycPrB8CqcFGCycM=";

      # mountains and stars
      # url = "https://raw.githubusercontent.com/anotherhadi/awesome-wallpapers/refs/heads/main/app/static/wallpapers/moutains-and-stars_black.png";
      # sha256 = "sha256-xVhaeAGs4U1zpx/WlGv17Vtr3uw92qNq0JvgXqAnEpE=";

      # svdden death 
      url =
        "https://raw.githubusercontent.com/shaunakpandit/wallpapers/main/Desktop/SvddenDeathBackgroundSkinny.png";
      sha256 = "sha256-PCiiNuRtNaVDJBZFh0znxUbADX/Wd3j0+xOnkoiWXNw=";
    };
  };
}
