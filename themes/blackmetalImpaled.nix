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
    # See https://github.com/metalelf0/base16-black-metal-scheme for blackmetal
    base16Scheme = {
        base00 = "000000"; # background
        base01 = "191A11"; # alt dark background
        base02 = "333333"; # selection background
        base03 = "505050"; # dim text / comments
        base04 = "888888"; # mid gray
        base05 = "c1c1c1"; # foreground
        base06 = "aaaaaa"; # lighter gray
        base07 = "ffffff"; # not in original; white for completeness

        base08 = "5f8787"; # accent (from palette 1 / 9)
        base09 = "DC2A22"; # strong red
        base0A = "c1c1c1"; # also cursor color
        base0B = "999999"; # secondary gray
        base0C = "B29740"; # gold accent
        base0D = "aaaaaa"; # light gray
        base0E = "DC2A22"; # reuse red accent
        base0F = "191A11"; # darkest alt background
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
      url = "https://raw.githubusercontent.com/shaunakpandit/wallpapers/main/Desktop/SvddenDeathBackgroundSkinny.png";
      sha256 = "sha256-PCiiNuRtNaVDJBZFh0znxUbADX/Wd3j0+xOnkoiWXNw=";
    };
  };
}
