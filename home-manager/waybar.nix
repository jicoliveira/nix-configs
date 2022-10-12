{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      layer = "top";
      modules-left = ["sway/workspaces" "sway/mode"];
      modules-center = ["sway/window"];
      modules-right = ["battery" "clock"];
      "sway/window" = {
          max-length = 50;
      };
      battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" "" ];
          format-charging = " {capacity}%";
      };
      clock = {
          format-alt = "{:%a, %d. %b  %H:%M}";
      };
    };
  }
}
 