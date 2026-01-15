{pkgs, lib, inputs, ...}:
  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
  stylix.targets.firefox = {
    enable = true;
    # profileNames = ["ploopy"];
  };
  programs.firefox = {
      enable = true;
      profiles = {
        ploopy = {
          id = 0;
          name = "default";
          isDefault = true;

          extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
            ublock-origin
            vimium
            darkreader
            proton-pass
          ];
          bookmarks = {};

          settings = {
            # for stylix to work
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "layout.css.prefers-color-scheme.content-override" = 0;
          };
          /* ---- POLICIES ---- */
          # Check about:policies#documentation for options.
          policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
              Value= true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = true;
            };
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisableAccounts = true;
            DisableFirefoxScreenshots = true;
            OverrideFirstRunPage = "";
            OverridePostUpdatePage = "";
            DontCheckDefaultBrowser = true;
            DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
            DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
            SearchBar = "unified"; # alternative: "separate"

            /* ---- PREFERENCES ---- */
            # Check about:config for options.
            Preferences = { 
              "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
              "extensions.pocket.enabled" = lock-false;
              "extensions.screenshots.disabled" = lock-true;
              "browser.topsites.contile.enabled" = lock-false;
              "browser.formfill.enable" = lock-false;
              "browser.search.suggest.enabled" = lock-false;
              "browser.search.suggest.enabled.private" = lock-false;
              "browser.urlbar.suggest.searches" = lock-false;
              "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
              "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
              "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
              "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
              "browser.newtabpage.activity-stream.showSponsored" = lock-false;
              "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
            };
          };

          search = {
            force = true;
            default = "google";
            order = [ "google" ];
            engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "@nw" ];
              };
              # "Searx" = {
              #   urls = [{ template = "https://searx.aicampground.com/?q={searchTerms}"; }];
              #   iconUpdateURL = "https://nixos.wiki/favicon.png";
              #   updateInterval = 24 * 60 * 60 * 1000; # every day
              #   definedAliases = [ "@searx" ];
              # };
              bing.metaData.hidden = true;
              # "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            };
          };
        };
      };
  };
}
