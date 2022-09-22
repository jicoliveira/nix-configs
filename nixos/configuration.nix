
{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix

  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  networking = {
    hostName = "carnotaurus";
    networkmanager.enable = true; 
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.dbus.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  
  users.users = {
    julio = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  time.timeZone = "America/Sao_Paulo";
  system.stateVersion = "22.05";
}
