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
            "name" = "libpipewire-module-protocol-simple";
            "args" = {
              # Provide sink
              "capture" = true;
              "audio.rate" = 96000;
              "audio.format" = "S24_32";
              "audio.channels" = 2;
              "audio.position" = [ "FL" "FR" ];

              # The addresses this server listens on for new
              # client connections
              "server.address" = [
                "tcp:4711"
              ];

              "capture.props" = {
                # Make this a sink instead of a capture stream
                "media.class" = "Audio/Sink";
              };
            };
          }];
        };
      };
    };
  };
}
