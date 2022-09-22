{ inputs, lib, config, pkgs, ... }: {
  imports = [
      # inputs.hyprland.homeManagerModules.default
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
    # vlc
    # libreoffice
    # vscode
    # insomnia
    # dbeaver
  ];

  programs = {
    neovim.enable = true;
    home-manager.enable = true;
    git.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
