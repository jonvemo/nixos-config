{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Jonvemo";
          email = "rettouseisama@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };

    gh.enable = true;
  };
}
