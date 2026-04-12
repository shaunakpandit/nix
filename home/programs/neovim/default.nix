{ inputs, pkgs, ... }:
{

  xdg.desktopEntries.nvim = {
    name = "Neovim";
    comment = "Edit text files";
    exec = "ghostty -e nvim %F";
    icon = "nvim";
    terminal = false;
    categories = [
      "Utility"
      "TextEditor"
    ];
    mimeType = [
      "text/plain"
      "text/x-python"
      "text/x-tex"
    ];
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
    # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };

xdg.configFile."nvim" = {
  source = builtins.filterSource
    (path: type:
      baseNameOf path != "nvim-pack-lock.json")
    ./nvim;
  recursive = true;
};
}
