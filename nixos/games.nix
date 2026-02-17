{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # games
    mangohud
    protontricks

    (writeShellScriptBin "steam2" ''

      #!/usr/bin/env bash
      export SDL_VIDEODRIVER=wayland,x11,windows

      nohup steam "$@" >/dev/null 2>&1 &
      disown
    '')
  ];

  programs.steam = {
    enable = true;

    package = pkgs.steam.override {
      extraEnv = {
        SDL_VIDEODRIVER = "wayland,x11,windows";
      };
    };

    ## old command for steam: gamescope -w 3840 -h 2160 -- %command%
    gamescopeSession = {
      enable = true;
      # command
      args = [
        # for 4k
        "--nested-width 3840"
        "--nested-height 2160"

        "--adaptive-sync"
        "--hdr-enabled"
        "--hdr-debug-force-output"
        "--steam"
        "--rt"
        "--f"
        # for HDR support
        # "--cm-fs-passthrough=0"
        # "--cm-auto-hdr=2"
      ];
      env = {
        WLR_RENDERER = "vulkan";
        DXVK_HDR = "1";
        PROTON_ENABLE_HDR = "1";
        ENABLE_HDR_WSI = "1";
        ENABLE_GAMESCOPE_WSI = "1";
        WINE_FULLSCREEN_FSR = "1";
      };
      steamArgs = [
        "-tenfoot"
        "-pipewire-dmabuf"
      ];
    };
  };
  # programs.steam.enable = true;
  # programs.steam.gamescopeSession.enable = true;
  # programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  # for starCitizen
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
  # 1) udev rules for general input/hidraw + your VKB sticks
  services.udev.extraRules = ''
    # grant logind uaccess to every input device
    SUBSYSTEM=="input"  , TAG+="uaccess"
    SUBSYSTEM=="hidraw" , TAG+="uaccess"

    # your existing VKB rule
    KERNEL=="hidraw*", ATTRS{idVendor}=="231d", ATTRS{idProduct}=="*", MODE="0660", TAG+="uaccess"

    # optional: always symlink your Gladiator to /dev/input/js0
    KERNEL=="js[0-9]*", ATTRS{idVendor}=="231d", ATTRS{idProduct}=="*", \
      SYMLINK+="input/js0", TAG+="uaccess"
  '';

  # 2) add your user to "input" so you can open /dev/input/*
  users.users."${config.var.username}".extraGroups = [ "input" ];

  # 3) ensure USB-HID modules are in the initrd for hot-plug
  boot.kernelModules = [
    "usbhid"
    "hid-generic"
  ];

  # enable udev rules for openRBG
  services.hardware.openrgb.enable = true;
}
