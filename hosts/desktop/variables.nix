{ config, lib, ... }: {
  imports = [
    # Choose your theme here:
    ../../themes/darkmetal.nix
  ];

  config.var = {
    hostname = "nexus";
    username = "shaunak";
    configDirectory = "/home/" + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Washington DC";
    timeZone = "America/New_York";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "shaunakpandit";
      email = "shaunakdpandit@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };
}
