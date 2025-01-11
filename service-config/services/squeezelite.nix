{ ... }:
{
  services.squeezelite = {
    enable = true;
    pulseAudio = true;
    extraArguments = ''-o pipewire -s 192.168.254.6 -n "Office PC"'';
  };
}
