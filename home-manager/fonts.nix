{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.fira
    (pkgs.nerdfonts.override { fonts = [ "FiraCode"]; })
  ];
}
