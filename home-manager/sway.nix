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
  wayland.windowManager.sway = 
    let
      modifier = "Mod4";
    in
    {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        modifier = modifier;
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

          # screenshot
          "${modifier}+p" = "exec grimshot copy area";
          "${modifier}+Shift+p" = "exec grimshot copy active";
          "${modifier}+Ctrl+p" = "exec grimshot copy window";

          # general bindings
          "${modifier}+d" = "exec ${menu}";
          "${modifier}+Return" = "exec ${term}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+Shift+c" = "reload";
          "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
          
          # move your focus around
          "${modifier}+${left}" = "focus left";
          "${modifier}+${down}" = "focus down";
          "${modifier}+${up}" = "focus up";
          "${modifier}+${right}" = "focus right";
          "${modifier}+Shift+${left}" = "move left";
          "${modifier}+Shift+${down}" = "move down";
          "${modifier}+Shift+${up}" = "move up";
          "${modifier}+Shift+${right} " = "move right";
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
          "${modifier}+0" = "workspace number 10";
          "${modifier}+Shift+1" = "move container to workspace number 1";
          "${modifier}+Shift+2" = "move container to workspace number 2";
          "${modifier}+Shift+3" = "move container to workspace number 3";
          "${modifier}+Shift+4" = "move container to workspace number 4";
          "${modifier}+Shift+5" = "move container to workspace number 5";
          "${modifier}+Shift+6" = "move container to workspace number 6";
          "${modifier}+Shift+7" = "move container to workspace number 7";
          "${modifier}+Shift+8" = "move container to workspace number 8";
          "${modifier}+Shift+9" = "move container to workspace number 9";
          "${modifier}+Shift+0" = "move container to workspace number 10";
          
          # layout stuff
          "${modifier}+s" = "layout stacking";
          "${modifier}+t" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";
          "${modifier}+f" = "floating toggle";
          "${modifier}+Shift+r" = "mode resize";
          "${modifier}+v" = "split v";
          "${modifier}+h" = "split h";

        };
      };
  };
}

