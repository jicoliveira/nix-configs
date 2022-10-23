{ pkgs, lib, config, ... }:
{
  imports = [
    ./waybar.nix
  ];
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
        modifier = "Mod4";
        menu = "${pkgs.wofi}/bin/wofi --show drun";
        terminal = "${config.programs.alacritty.package}/bin/alacritty";
        startup = [
          {command = "${pkgs.gammastep} -t 6000:4000 -l -22:-30"}
        ];
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
        inner = 5;
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
        "Print" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot --notify copy output";
        
      };
    };
  };
}

