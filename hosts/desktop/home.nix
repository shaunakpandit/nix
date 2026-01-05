{ pkgs, config, ... }: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/ghostty
    ../../home/programs/neovim
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/git/signing.nix
    ../../home/programs/spicetify
    # ../../home/programs/nextcloud
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/zen
    ../../home/programs/qutebrowser
    ../../home/programs/duckduckgo-colorscheme
    ../../home/programs/discord
    ../../home/programs/tailscale

    # proton clients
    ../../home/programs/proton

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    # ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpaper
    ../../home/system/wofi
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/walker
    ../../home/system/udiskie
    # ../../home/system/clipman

    # games
    ../../home/programs/prismlauncher.nix
    ../../home/programs/runelite.nix
    ../../home/programs/nixCitizen.nix

    # ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      bitwarden-desktop # Password manager
      vlc # Video player
      blanket # White-noise app
      obsidian # Note taking app
      planify # Todolists
      gnome-calendar # Calendar
      textpieces # Manipulate texts
      curtail # Compress images
      resources # Ressource monitor
      gnome-clocks # Clocks app
      gnome-text-editor # Basic graphic text editor
      mpv # Video player
      openrgb # rbg manager

      # Dev
      go
      bun
      nodejs
      python3
      jq
      just
      pnpm
      air
      rustc
      cargo
      harper
      gh

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      fastfetch

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix

      # Backup
      brave
      vscode

      # gaming
      protonup-ng

      # entertainment
      plexamp
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "\\\${HOME}/.steam/root/compatibilitytools.d";
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
