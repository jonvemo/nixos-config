{
  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        mgr = {
          sort_sensitive = true;
          show_symlink = true;
        };
        open.rules = [
          { mime = "*"; use = "open"; }
        ];
      };
    };
  };
}
