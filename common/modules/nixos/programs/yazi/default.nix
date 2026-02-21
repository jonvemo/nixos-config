{
  programs.yazi = {
    enable = true;
    settings = {
      yazi = {
        mgr = {
          sort_sensitive = true;
          show_symlink = true;
        };
        opener.music = [
          { run = "footclient -T kew kew $(basename %s)"; orphan = true; for = "linux"; }
        ];
        open.rules = [
          { mime = "text/*"; use = "edit"; }
          { mime = "application/*"; use = "edit"; }
          { mime = "audio/*"; use = "music"; }
          { mime = "*"; use = "open"; }
        ];
      };
      keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "<A-d>" ];
            run = "shell -- ouch decompress %s";
            desc = "Decompress with ouch";
          }
          {
            on = [ "<A-c>" ];
            run = "shell 'ouch compress %s ' --interactive";
            desc = "Compress with ouch";
          }
        ];
      };
    };
  };
}
