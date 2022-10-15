{ pkgs, lib, config, ... }:
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
        bars = [{
          command = "waybar";
        }];      
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
        inner = 10;
      };
	
			keybindings = lib.mkOptionDefault {
				# brightness
				"XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s +10%";
				"XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%-";

        # volume
        "XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";

        #screenshot
        "Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify copy output";
			};
		};
  };
}
