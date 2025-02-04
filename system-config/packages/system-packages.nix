{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs;
    [
      desktop-file-utils
      git
      kitty
      python313
      nixpkgs-fmt
      nixfmt-classic
      vim
      networkmanagerapplet

    ] ++ [ (pkgs.libsForQt5.callPackage ./openrgb/openrgb.nix { }) ];
}
