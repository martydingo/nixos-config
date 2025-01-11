{ lib, pkgs, ... }:
{
  services.squeezelite = {
    enable = true;
    # extraArguments = '''';
  };
  systemd.services.squeezelite.serviceConfig.ExecStart = lib.mkForce ''${pkgs.squeezelite}/bin/squeezelite -o pipewire -s 192.168.254.6 -n "Office PC"'';
  systemd.services.squeezelite.serviceConfig.DynamicUser = lib.mkForce false;
}
