{ ... }:
{
  services.squeezelite = {
    enable = true;
    extraArguments = ''-o pipewire -s 192.168.254.6 -n "Office PC"'';
  };
  systemd.services.squeezelite.serviceConfig.supplementaryGroups = "pipewire";
}
