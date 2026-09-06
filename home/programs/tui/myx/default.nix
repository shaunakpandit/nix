# Myx is a lean terminal Spotify player written in Rust, with album-art-reactive
# theming, a live visualizer and synced lyrics.
{
  config,
  pkgs,
  lib,
  ...
}: let
  # https://github.com/NixOS/nixpkgs/pull/555072
  myx = pkgs.nur.repos.anotherhadi.myx;
in {
  home.packages = [myx];

  home.persistence."/persist" = lib.mkIf (config.var.impermanenceEnabled or false) {
    directories = [".config/myx"];
  };

  xdg.desktopEntries.myx = {
    name = "Spotify";
    exec = "${pkgs.ghostty}/bin/ghostty +new-window -e ${myx}/bin/myx";
    icon = "spotify";
    comment = "Control Spotify from the terminal";
    categories = ["Audio" "Music"];
    terminal = false;
    settings.Keywords = "spotify;myx;music;";
  };
}
