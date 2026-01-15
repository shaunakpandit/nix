{pkgs, ...}: {
  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--no-default-browser-check"
      "--disable-features=WaylandWpColorManagerV1"
      "--enable-features=UseMonitorColorSpace,CanvasOopRasterization"
      "--force-color-profile=HDR10"
    ];
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } ## ublock 
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } ## darkreader
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } ## vimium
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } ## youtube sponserBlock
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } ## protonPass
    ];
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };
}
