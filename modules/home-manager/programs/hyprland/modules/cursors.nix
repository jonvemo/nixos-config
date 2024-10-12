let
  config = ''
    cursor {
      persistent_warps = true
      hide_on_key_press = true
    }
  '';
in
{
  xdg.configFile."hypr/modules/cursors.conf".text = config;
}
