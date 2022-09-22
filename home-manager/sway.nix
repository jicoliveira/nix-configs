{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      bars = [];
      input = {
        "*" = {
          xkb_layout = "br";
        };
        "type:touchpad" = {
          tap = "enabled";
        };
      };
      gaps = {
        inner = 15;
      };
    };
  };
}
