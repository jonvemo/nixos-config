{
  programs.rclone = {
    enable = true;

    remotes = {
    
      OneDrive = {
        config = {
          type = "onedrive";
        };
        mounts = {
          "OneDrive" = {
            enable = true;
            mountPoint = "/home/jonvemo/Rclone/OneDrive";
          };
        };
      };

      # NOTE Don't work
      GoogleDrive = {
        config = {
          type = "drive";
          scope = "drive";
        };
        mounts = {
          "GoogleDrive" = {
            enable = true;
            mountPoint = "/home/jonvemo/Rclone/GoogleDrive";
          };
        };
      };
      
    };
  };
}
