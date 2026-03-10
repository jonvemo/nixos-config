{ lib, ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;

      format = "";
      
      right_format = lib.concatStrings [
        "$cmd_duration"
        "[](white)"
        "$git_branch"
        "$git_status"
        "[](fg:black bg:white)"
        "$directory"
        "[](fg:white bg:black)"
        "$username"
        "[](white)"
      ];

      username = {
        show_always = true;
        style_user = "fg:black bg:white";
        style_root = "fg:black bg:white";
        format = "[ $user ](bold $style)";
        disabled = false;
      };

      directory = {
        style = "fg:white bg:black";
        format = "[ $path ]($style)";
        truncation_length = 2;
        home_symbol = "  ";

        substitutions = {
          "Documents" = " 󰈙 ";
          "Downloads" = "  ";
          "Music" = "  ";
          "Pictures" = "  ";
        };
      };

      git_branch = {
        symbol = "";
        style = "fg:black bg:white";
        format = "[ $branch $symbol ](bold $style)";
      };

      git_status = {
        style = "fg:black bg:white";
        format = "[$all_status $ahead_behind]($style)";
      };

      cmd_duration = {
        disabled = false;
        style = "fg:white";
        format = "[ $duration ]($style)";
        show_milliseconds = true;
      };
      
    };
    
  };

}
