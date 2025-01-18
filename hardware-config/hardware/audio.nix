{ ... }:
{
  security.rtkit.enable = true;
  services.dbus.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
    systemWide = true;
    extraConfig = {
      pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.rate" = 96000;
            "audio.format" = "S32LE";
          };
          "91-null-sinks" = {
            "context.objects" = [
              {
                # A default dummy driver. This handles nodes marked with the "node.always-driver"
                # properyty when no other driver is currently active. JACK clients need this.
                factory = "spa-node-factory";
                args = {
                  "factory.name" = "support.node.driver";
                  "node.name" = "Dummy-Driver";
                  "priority.driver" = 8000;
                };
              }
              {
                factory = "adapter";
                args = {
                  "factory.name" = "support.null-audio-sink";
                  "node.name" = "Microphone-Proxy";
                  "node.description" = "Microphone";
                  "media.class" = "Audio/Source/Virtual";
                  "audio.position" = "MONO";
                };
              }
              {
                factory = "adapter";
                args = {
                  "factory.name" = "support.null-audio-sink";
                  "node.name" = "Main-Output-Proxy";
                  "node.description" = "Main Output";
                  "media.class" = "Audio/Sink";
                  "audio.position" = "FL,FR";
                };
              }
            ];
          };
        };
      };
    };
  };
}

