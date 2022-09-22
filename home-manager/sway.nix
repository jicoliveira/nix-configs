{ pkgs, config, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "FiraCode Nerd Font";
        };
      };
    };
  };
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      terminal = "${config.programs.alacritty.package}/bin/alacritty";
      bars = [];
      fonts = {
        names = [ "Fira Sans" ];
        size = 12.0;
      };
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
