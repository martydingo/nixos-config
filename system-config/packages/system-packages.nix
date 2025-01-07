{ inputs, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    desktop-file-utils
    git
    kitty
    python313
    nixpkgs-fmt
    vim
  ];
}
