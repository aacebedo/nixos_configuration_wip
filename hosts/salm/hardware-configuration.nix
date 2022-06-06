{ config, lib, pkgs, modulesPath, ... }:
{
  boot.initrd.availableKernelModules = [ "uhci_hcd" "ehci_pci" "ahci" "xhci_pci" "nvme" "uas" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "iwlwifi" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault false;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
 
  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;
  hardware.video.hidpi.enable = lib.mkDefault true;
}
