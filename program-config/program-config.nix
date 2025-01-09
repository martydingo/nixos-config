{ ... }:
{
  imports = [
    ./programs/hyprland.nix
    ./programs/steam.nix
  ];

  programs.nm-applet = {
    enable = true;
  };

}
