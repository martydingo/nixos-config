{ ... }:
{
  imports = [
    ./environment.nix
    ./configs/time.nix
    ./configs/locale.nix
    ./configs/nix.nix
    ./configs/nixpkgs.nix
    ./packages/system-packages.nix
    ./virtualisation-config.nix
  ];
  programs.nix-ld.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
