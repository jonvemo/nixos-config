{pkgs,...}:

{
  gaming = {
    enable = true;

    games = {
      minecraft.enable = true;
      osu.enable = true;
    };

    extraPackages = with pkgs; [ r2modman ];
    
  };
}
