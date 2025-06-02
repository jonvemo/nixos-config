{inputs,pkgs,...}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;
    
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
      };

      SanitizeOnShutdown = {
        Cache = true;
      };

      Cookies = {
        Behavior = "reject-tracker-and-partition-foreign";
      };

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
              filerLists = [
                "ublock-privacy"
                "ublock-badware"
                "ublock-filters"
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
