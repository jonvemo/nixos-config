{
  imports = [
#    ./theme.nix
  ];

  programs.kitty = {
    enable = true;
    # shellIntegration.enableBashIntegration = true;
    shellIntegration.enableFishIntegration = true;

    settings = {
      confirm_os_window_close = 0; 
      allow_remote_control = "yes";
      scrollback_lines = 10000;
      copy_on_select = "yes";
      enabled_layouts = "grid";
      window_border_width = "2pt";
      window_padding_width = "2";
      window_margin_width = "0";
      draw_minimal_borders = "no";
      bell_on_tab = "yes";
      tab_bar_style = "powerline";
      tab_activity_symbol = "😼";
      tab_title_template = " {title[title.rfind('/')+1:]} {tab.active_exe} {activity_symbol}";

      # action_alias = ""
      
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "f1" = "launch --type=window --cwd=current lazygit";
      
    };
    
  };
}
