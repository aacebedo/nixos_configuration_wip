{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../common.nix
      ../common_de.nix
    ];

  networking = {
    hostName = "salm";
    wireless.userControlled.enable = true;
#    wireless.enable = true;
  };

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
