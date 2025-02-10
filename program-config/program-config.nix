{ ... }: {
  imports = [
    ./programs/regreet.nix
    ./programs/coolercontrol.nix
    ./programs/hyprland.nix
    ./programs/steam.nix
  ];

  programs.nm-applet = { enable = true; };

}
