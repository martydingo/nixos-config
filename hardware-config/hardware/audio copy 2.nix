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
          "context.modules" = [{
            "name" = "libpipewire-module-snapcast-discover";
            "args" = {
              "stream.rules" = [
                {
                  matches = [
                    {
                      "snapcast.ip" = "192.168.254.6";
                    }
                  ];
                  actions = {
                    create-stream = {
                      "audio.rate" = 96000;
                      "audio.format" = "S24_32LE"; # S16LE, S24_32LE, S32LE
                      "audio.channels" = 2;
                      #audio.position = [ FL FR ]
                      "snapcast.stream-name" = "Office";
                      #
                      capture = true;
                      "capture.props" = {
                        "target.object" = "";
                        "media.class" = "Audio/Sink";
                      };
                    };
                  };
                }
              ];
            };
          }];
        };
      };
    };
  };
}
