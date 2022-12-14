{ inputs, lib, config, pkgs, ... }: {
  imports = [
      ./sway.nix  
      ./fonts.nix  
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "julio";
    homeDirectory = "/home/julio";
  };


  home.packages = with pkgs; [ 
    bottom
    firefox
    vscodium
    pavucontrol
    evince
    gnome.nautilus
    gnome.adwaita-icon-theme
    deluge
    vlc
    libreoffice
  ];

  programs = {
    neovim.enable = true;
    home-manager.enable = true;
    git.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
