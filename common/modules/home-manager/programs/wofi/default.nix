{
  programs.wofi = {
    enable = true;
    settings = {
      width = 576;
      height = 256;
      mode = "drun";
      matching = "fuzzy";
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
