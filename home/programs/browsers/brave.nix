{pkgs, ...}: {
  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--no-default-browser-check"
    ];
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } ## ublock 
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } ## darkreader
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } ## vimium
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } ## youtube sponserBlock
      { id = "ghmbeldphafepmbegfdlkpapadhbakde"; } ## protonPass
    ]
  };

  home.sessionVariables = {
    DEFAULT_BROWSER = "${pkgs.brave}/bin/brave";
  };
}
