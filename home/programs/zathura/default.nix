# TODO: Misc section with VLC, Zathura etc
# Zathura is a PDF viewer
{
  programs.zathura = {
    enable = true;

    options = {
      guioptions = "sv";
      adjust-open = "best-fit";
      statusbar-basename = true;
      render-loading = false;
      scroll-page-aware = true;
      scroll-step = 100;
      recolor = true;
      recolor-keephue = true;
    };
  };
}
