{
  programs.wofi = {
    enable = true;
    settings = {
      width = 384;
      height = 512;
      # location = "top-left";
      show = "drun";
      columns = 1;
      allow_images= true;
      image_size= 24;
      prompt = "Search...";
      no_actions = true;

      # term = "kitty";
    };
    style = ''
      #window {border-radius: 8px;}
      #entry {padding: 6px 12px;}
      #img {padding-right: 10px;}
    '';
    
  };
  
}
