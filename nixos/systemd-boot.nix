# Systemd-boot configuration for NixOS
{pkgs, ...}: {
  boot = {
    bootspec.enable = true;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 8;
      };
      grub = {
        enable = true;
        efiSupport = true; # Set to true for UEFI systems
        useOSProber = true; # Detect Windows and other OSes
        configurationLimit = 8; # Optional: keep only the latest boot configs
        device =
          "nodev"; # For UEFI ('nodev'); use actual device for legacy BIOS (e.g., "/dev/sda")
      };
    };
    tmp.cleanOnBoot = true;
    kernelPackages =
      pkgs.linuxPackages_latest; # _zen, _hardened, _rt, _rt_latest, etc.

    # Silent boot
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;

    # plymouth = {
    #   enable = true;
    #   theme = lib.mkForce "cuts_alt";
    #   themePackages = with pkgs; [
    #     (adi1090x-plymouth-themes.override {
    #       selected_themes = ["cuts_alt"];
    #     })
    #   ];
    # };
  };

  # To avoid systemd services hanging on shutdown
  systemd.settings.Manager = { DefaultTimeoutStopSec = "10s"; };
}
