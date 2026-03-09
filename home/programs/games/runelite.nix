{ pkgs, ... }:
{
  home.packages = with pkgs; [
    runelite
    openal
  ];
  home.sessionVariables = {
    LD_LIBRARY_PATH = "${pkgs.openal}/lib";
  };
}
