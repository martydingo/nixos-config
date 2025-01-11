{ ... }:
{
  services.squeezelite = {
    enable = true;
    extraArguments = ''-o pipewire -s 192.168.254.6 -n "Office PC"'';
  };
  systemd.services.squeezelite.serviceConfig.supplementaryGroups = "pipewire";
  systemd.services.squeezelite.serviceConfig.Environment = [ "XDG_RUNTIME_DIR=/run/user/1000" ];
}
