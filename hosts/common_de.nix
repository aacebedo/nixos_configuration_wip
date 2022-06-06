{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    libinput.enable = true;
  };

  sound.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    tdesktop
    signal-desktop
    firefox
    qt5.qtwayland
    light
    ncurses
    foot
    wl-clipboard
    fnott
    grim
    slurp
    oguri
    kanshi
    xdg-desktop-portal-wlr
    polkit_gnome
    brightnessctl
    pavucontrol
    nordic
    papirus-icon-theme
    capitaine-cursors
    sway
    autotiling
    haskellPackages.greenclip
    rofi-wayland
    libsForQt5.qt5ct
    gnome.nautilus
    gnome.gnome-settings-daemon
    gsettings-desktop-schemas
    at-spi2-core
    rbw
    rofi-rbw
    tmux
    seafile-client
    powerline
    cryptsetup
     fido2luks
  ];

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Noto" ]; })
  ];

  environment.extraInit = ''
    export XDG_DATA_DIRS="${pkgs.nordic}/share:${pkgs.capitaine-cursors}/share:${pkgs.capitaine-cursors}/share:$XDG_DATA_DIRS"
    export XDG_DATA_DIRS="${pkgs.capitaine-cursors}/share:$XDG_DATA_DIRS"
    export XDG_DATA_DIRS="${pkgs.papirus-icon-theme}/share/share:$XDG_DATA_DIRS"
  '';

  programs.sway = {
    enable = true;
  };

  environment.pathsToLink = [ "/libexec" ];
}
