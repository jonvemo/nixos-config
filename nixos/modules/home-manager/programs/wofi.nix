{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      columns = 2;
      allow_images= true;
      image_size= 24;
      term = "kitty";
      
      prompt = "Search...";
      no_actions = true;
    };
    style = ''
      #window {border-radius: 8px;}
      #entry {padding: 4px 8px;}
      #img {padding-right: 8px;}
    '';
    
  };
  
}
