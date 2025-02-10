{ inputs, ... }:
let pkgs = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
in {
  # Common
  environment.systemPackages = with pkgs.coolercontrol; [ coolercontrol-gui ];

  systemd = {
    packages = with pkgs.callPackage ./coolercontrol/default.nix { }; [
      coolercontrol-liqctld
      coolercontrold
    ];

    # https://github.com/NixOS/nixpkgs/issues/81138
    services = {
      coolercontrol-liqctld.wantedBy = [ "multi-user.target" ];
      coolercontrold.wantedBy = [ "multi-user.target" ];
    };
  };
}
