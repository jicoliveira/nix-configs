{ inputs, lib, config, pkgs, ... }: {
  imports = [
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

  programs.neovim.enable = true;
  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
