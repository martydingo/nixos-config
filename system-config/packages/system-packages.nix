{ inputs, pkgs, ... }:

let
  # openRgb = (pkgs.libsForQt5.callPackage ./openrgb/openrgb.nix { }).withPlugins
  #   [
  #     (pkgs.libsForQt5.callPackage
  #       ./openrgb/openrgb-hardwaresync/openrgb-hardwaresync.nix { })
  #   ];
  # openRgb = (pkgs.libsForQt5.callPackage ./openrgb/openrgb.nix { }).withPlugins
  #   [ pkgs.openrgb-plugin-hardwaresync ];

  # .withPlugins (plugins: [ plugins.openrgb-plugin-hardwaresync ])

in {
  environment.systemPackages = with pkgs; [
    desktop-file-utils
    git
    kitty
    python313
    nixpkgs-fmt
    nixfmt-classic
    vim
    networkmanagerapplet
    # openRgb
    (pkgs.libsForQt5.callPackage ./openrgb/openrgb.nix { })
    (pkgs.python3Packages.callPackage ./liquidctl/liquidctl.nix { })
    wineWow64Packages.full
    wineWowPackages.full
    winetricks
  ];
}
