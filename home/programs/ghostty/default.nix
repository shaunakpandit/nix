{
  pkgs,
  userConfig,
  lib,
  theme,
  ...
}:
{
  # Ensure alacritty package installed
  home.packages = with pkgs; [ ghostty ];

  home.file.".config/ghostty/themes/dmImmortal.conf".source = ./themes/dmImmortal.conf;

  # Install alacritty via home-manager module
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dmImmortal.conf";
      font-size = 17;
      font-family = "Hack Nerd Font";
      font-thicken = true;
      window-padding-x = 12;
      window-padding-y = 12;
      mouse-hide-while-typing = true;
      background-opacity = 0.95;
    };
  };
}
