{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Wayland
    # HYPRCURSOR_THEME = "Lifrim"; # No parece Funcionar ?
    # HYPRCURSOR_SIZE = "24";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };
  
}
