{ lib, ... }: {
  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" ];
      kernelModules = [ "amdgpu" "vfio_pci" "vfio" "vfio_iommu_type1" ];
    };

    kernelParams = [
      "amd_iommu=on"
      ("vfio-pci.ids=" + lib.concatStringsSep "," [
        "10de:2684" # Graphics
        "10de:22ba" # Audio
      ])
      "drm.edid_firmware=HDMI-A-1:edid/evanlak8k.bin"
    ];

    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };

    zfs.extraPools = [ "os" ];
    kernel.sysctl."vm.swappiness" = 10;
    supportedFilesystems = [ "zfs" ];
    kernelModules = [ ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
      blacklist nouveau
      options nouveau modeset=0
    '';

  };

}
