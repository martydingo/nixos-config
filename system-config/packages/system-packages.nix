{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixpkgs-fmt
    desktop-file-utils
    vim
    kitty
    git
  ];
}
