{ inputs,pkgs,hosts,... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    profiles."${hosts.primary.users.primary.name}" = {
      containers = {
        "personal" = {
          id = 1;
          color = "blue";
          icon = "fingerprint";
        };
        "work" = {
          id = 2;
          color = "yellow";
          icon = "briefcase";
        };
      };
    };
    
    policies = {
      DisplayBookmarksToolbar = "newtab";
      NoDefaultBookmarks = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisableAppUpdate = true;
      BlockAboutSupport = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      HttpsOnlyMode = "enabled";

      Preferences = {
        "browser.translations.automaticallyPopup" = {
          Value = false;
          Status = "user";
        };
        "places.history.expiration.max_pages" = {
          Value = 2000;
        };
      };

      SanitizeOnShutdown = {
        Cache = true;
      };

      Cookies = {
        Behavior = "reject";
        BehaviorPrivateBrowsing = "reject";
        Allow = [
          "https://google.com/"
          "https://youtube.com/"
          "https://github.com/"
          "https://discord.com/"
          "https://facebook.com/"
          "https://x.com/"
        ];
        AllowSession = [
          "https://vercel.com/"
          "https://linkedin.com/"
        ];
      };      

      SearchEngines.Add = [
        {
          Name = "Nix Packages";
          URLTemplate = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
          Method = "GET";
          Alias = "@np";
        }
        {
          Name = "Nix Options";
          URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
          Method = "GET";
          Alias = "@no";
        }
        {
          Name = "YouTube";
          URLTemplate = "https://youtube.com/results?q={searchTerms}";
          Method = "GET";
          Alias = "@yt";
        }
      ];

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          private_browsing = true;
        };
        "sponsorBlocker@ajay.app" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
        "support@premid.app" = {
          installation_mode = "normal_installed";
          install_url = "https://dl.premid.app/PreMiD.xpi";
        };
      };

      "3rdparty" = {
        Extensions = {
          "uBlock0@raymondhill.net" = {
            userSettings = [
              [ "contextMenuEnabled" "false" ]
              [ "ignoreGenericCosmeticFilters" "true" ]
            ];
            toOverwrite = {
              filterLists = [
                "ublock-privacy"
                "ublock-badware"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "ublock-filters"
                "easylist"
              ];
            };
            disabledPopupPanelParts = [
              "basicTools"
              "extraTools"
              "overviewPane"
            ];
            
          };
        };
      };
      
    };
  };
}
