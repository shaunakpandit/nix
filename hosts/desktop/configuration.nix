{ config, pkgs, ... }:
{
  imports = [
    # Mostly system related configuration
    ../../nixos/nvidia.nix # CHANGEME: Remove this line if you don't have an Nvidia GPU
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/sddm.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    # ../../nixos/tailscale.nix
    ../../nixos/hyprland.nix
    ../../nixos/docker.nix
    ../../nixos/games.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  environment.systemPackages = [
    pkgs.gimp # photoshop software
    pkgs.rustup # for fff.nvim
    pkgs.iwe # for iwe pkm system
    pkgs.tree-sitter # for nvim
    pkgs.mysql84
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  # Don't touch this
  system.stateVersion = "24.05";
}
