{ pkgs, ... }: {

  xdg.desktopEntries.nvim = {
    name = "Neovim";
    comment = "Edit text files";
    exec = "ghostty -e nvim %F";
    icon = "nvim";
    terminal = false;
    categories = [ "Utility" "TextEditor" ];
    mimeType = [ "text/plain" "text/x-python" "text/x-tex" ];
  };

  # Neovim text editor configuration
  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      cargo
      imagemagick
      lua-language-server
      stylua
      gopls
      markdown-oxide
      nil
      # pkgs.lua-language-server
      # pkgs.stylua 
    ];
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

  # lua config 
  xdg.configFile = {
    "nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
}
