{ lib, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    # use the stock tmux from nixpkgs
    package = pkgs.tmux;

    # plugins that live in nixpkgs
    plugins = with pkgs.tmuxPlugins; [

    ];
  };
  # lua config
  xdg.configFile = {
    "tmux" = {
      source = ./tmux;
      recursive = true;
    };
  };
}
