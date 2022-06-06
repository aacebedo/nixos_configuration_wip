{
  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }:
  let
  in {
    nixosConfigurations = {
      salm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/salm/configuration.nix
        ];
      };
    };
  };
}
