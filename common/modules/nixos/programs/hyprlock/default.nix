
{
  programs.hyprlock.enable = true;
  environment = {
    etc."xdg/hypr/hyprlock.conf".source = "/etc/nixos/common/modules/nixos/programs/hyprlock/hyprlock.conf";
  };
}
