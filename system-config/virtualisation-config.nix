{ pkgs, ... }:
{
  imports = [
    ./packages/kvmfr-options.nix
  ];

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
    };
    kvmfr = {
      enable = true;

      shm = {
        enable = true;
        size = 512;
        user = "nobody";
        group = "nogroup";
        mode = "0777";
      };
    };
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
        swtpm.enable = true;
        verbatimConfig = ''
          cgroup_device_acl = [
            "/dev/kvmfr0",
            "/dev/null", "/dev/full", "/dev/zero",
            "/dev/random", "/dev/urandom",
            "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
            "/dev/rtc","/dev/hpet", "/dev/vfio/vfio"
          ]
          group = "root"
          user = "root"
        '';
      };
    };
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager.enable = true;
}
