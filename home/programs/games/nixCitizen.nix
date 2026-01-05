{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    inputs.nix-citizen.packages.${system}.star-citizen
    inputs.nix-citizen.packages.${system}.wine-astral
  ];
}
