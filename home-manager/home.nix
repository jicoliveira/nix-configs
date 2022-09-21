{ inputs, lib, config, pkgs, ... }: {
  imports = [
      inputs.hyprland.homeManagerModules.default
      ./sway.nix  
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "julio";
    homeDirectory = "/home/julio";
  };


  home.packages = with pkgs; [ 
    bottom
    vlc
    libreoffice
    vscode
    insomnia
    dbeaver
  ];
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.neovim.enable = true;
  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
