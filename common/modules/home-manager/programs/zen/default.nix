{inputs,pkgs,...}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;
    
    policies = {
      NoDefaultBookmarks = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      DisableFeedbackCommands = true;
      DisablePocket = true;
      DisplayBookmarksToolbar = "newtab";

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          private_browsing = true;
        };
      };
      
    };
  };
}
