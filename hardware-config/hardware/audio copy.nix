{ ... }:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    systemWide = true;
    extraConfig = {
      pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.rate" = 192000;
            "audio.format" = "S32LE";
          };
        };
        "10-network-audio-output" = {
          # cat /etc/pipewire/pipewire.conf.d/snapcast.conf
          "context.modules" = [
            {
              name = "libpipewire-module-pipe-tunnel";
              args = {
                node.name = "snapcast";
                tunnel.mode = "sink";
                #tunnel.may-pause = true
                # Set the pipe name to tunnel to
                pipe.filename = "/tmp/snapfifo";
                audio.format = "S24LE";
                audio.rate = 96000;
                #audio.channels=<number of channels>
                #audio.position=<channel map>
                #target.object=<remote target node>
                stream.props = {
                  # extra sink properties
                };
              };
            }
          ];
        };
      };
    };
  };
}
