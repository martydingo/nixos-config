{ ... }:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
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
      };
    };
  };
}
