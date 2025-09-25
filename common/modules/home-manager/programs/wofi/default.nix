{
  programs.wofi = {
    enable = true;
    settings = {
      height = 384;
      width = 640;
      term = "foot";
      mode = "drun";
      prompt = "Search...";
      allow_images = true;
      no_actions = true;
      columns = 2;
    };
    style = ''
      #input { margin: 16px; }
      #entry { padding: 8px; }
      #img { margin-right: 4px; }
    '';
  };
}
