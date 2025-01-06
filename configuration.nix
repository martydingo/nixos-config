{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./boot-config/boot-config.nix
      ./hardware-config/hardware-config.nix
      ./network-config/network-config.nix
      ./service-config/service-config.nix
      ./system-config/system-config.nix
      ./user-config/user-config.nix
      ./program-config/program-config.nix
    ];

  system.stateVersion = "24.11";
}

