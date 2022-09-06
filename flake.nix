{
  description = "You new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        specialArgs = { inherit inputs; };
        modules = [ 
          ./nixos/configuration.nix 
        ];
      };
    };

    homeConfigurations = {
      "julio@nixos" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs; }; 
          modules = [ 
            ./home-manager/home.nix 
          ];
        };
    };
  };
}
