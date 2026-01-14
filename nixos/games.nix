{ config, pkgs, ...} : {
  environment.systemPackages = with pkgs; [
    # games
    mangohud
    protontricks
  ];

    programs.steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
        args = [ "--adaptive-sync" "--hdr-enabled" "--steam" "--rt" ];
        env = {
          WLR_RENDERER = "vulkan";
          DXVK_HDR = "1";
          ENABLE_GAMESCOPE_WSI = "1";
          WINE_FULLSCREEN_FSR = "1";
        };
        steamArgs = [ "-tenfoot" "-pipewire-dmabuf" ];
      };
    };
  # programs.steam.enable = true;
  # programs.steam.gamescopeSession.enable = true;
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
  boot.kernelModules = [ "usbhid" "hid-generic" ];

  # enable udev rules for openRBG
  services.hardware.openrgb.enable = true;
}
