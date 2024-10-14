{
  services.hypridle = {
    enable = true;

    settings = 
      let
        screen = "hyprctl dispatch dpms";
        lis__lock_screen = 60; # Turn off screen if hyprlock is active
        lis__warn = 300;       # Send a Notify
        lis__lock = 600;       # Run Hyprlock
        lis__screen = 660;     # Turn off screen
        lis__suspend = 1200;   # Suspend
      in
    {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          ignore_dbus_inhibit = false;
        };
        listener = [
          {
            # Turn off screen if hyprlock is active
            timeout = lis__lock_screen;
            on_timeout = "pidof hyprlock && ${screen} off";
            on_resume = "pidof hyprlock && ${screen} on";
          }
          {
            # Warn
            timeout = lis__warn;
            on_timeout = "notify-send 'You are idle!'";
          }
          {
            # Lock
            timeout = lis__lock;
            on_timeout = "loginctl lock-session";
          }
          {
            # Turn off screen
            timeout = lis__screen;
            on-timeout = "${screen} off";
            on-resume = "${screen} on";
          }
          {
            # Suspend
            timeout = lis__suspend;
            on-timeout = "systemctl suspend";
            on-resume = "notify-send 'Welcome back to your desktop!'";
          }
        ];
    };
  };
}
