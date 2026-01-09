{ inputs,pkgs,user,... }:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;

    profiles."${user.name}" = {
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
      DisableAccessibilityServices = true;
      BlockAboutSupport = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      HttpsOnlyMode = "enabled";
      AutofillCreditCardEnabled = false;

      Preferences = {
        "browser.translations.automaticallyPopup" = {
          Value = false;
          Status = "user";
        };
        "places.history.expiration.max_pages" = {
          Value = 2000;
        };
        "privacy.fingerprintingProtection" = {
          Value = true;
        };
        "privacy.resistFingerprinting" = {
          Value = true;
        };
      };

      EnableTrackingProtection = {
        Value = true;
        EmailTracking = true;
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
          "https://discord.com/"
        ];
        AllowSession = [
          "https://linkedin.com/"
          "https://github.com/"
          "https://vercel.com/"
          "https://huggingface.co/"
          "https://yahoo.com/"
          "https://hapi.trade/"
          "https://www.remnote.com/"
          "https://cinny.in/"
          "https://matrix.org/"
          "https://matrix.to/"
          "https://facebook.com/"
          "https://x.com/"
          "https://pornhub.com/"
          "https://nhentai.net/"
          "https://modrinth.com/"
        ];
      };      

      SearchEngines.Add = [
        {
          Name = "NixOS";
          URLTemplate = "https://mynixos.com/search?q={searchTerms}";
          Method = "GET";
          Alias = "@n";
        }
        {
          Name = "YouTube";
          URLTemplate = "https://youtube.com/results?q={searchTerms}";
          Method = "GET";
          Alias = "@y";
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
