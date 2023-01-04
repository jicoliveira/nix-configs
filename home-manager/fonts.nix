{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.fira
    pkgs.source-sans
    pkgs.aurulent-sans
    pkgs.lato
    pkgs.liberation_ttf
    pkgs.montserrat
    (pkgs.nerdfonts.override { fonts = [ "FiraCode"]; })
  ];
}
