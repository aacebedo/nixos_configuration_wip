{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Paris";

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  environment.extraOutputsToInstall = [ "dev" "lib" "bin" ];
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    libinput
    zsh
    htop
    glances
    git
    thefuck
    neovim
    lsof
    wget
    tree
    bat
    delta
    du-dust
    duf
    broot
    fzf
    mcfly
    cheat
    tldr
    gtop
    gping
    procs
    dog
    exa
    zip
    unzip
    pciutils
  ];

  security.sudo.configFile = ''
    %wheel ALL=(ALL) ALL
  '';

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  system.stateVersion = "22.05";
}
