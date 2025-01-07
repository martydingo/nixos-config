{ ... }:
{
  services.rustdesk-server = {
    relay = {
      enable = true;
    };
    signal.relayHosts = [ "127.0.0.1" ];
    enable = true;
  };
}
