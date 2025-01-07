{ ... }:
{
  services.guacamole = {
    enable = true;
    host = "127.0.0.1";
    port = 4822;
  };
  services.guacamole-client = {
    enable = true;
    enableWebserver = true;
    settings = {
      guacd-port = 4822;
      guacd-hostname = "localhost";
    };
  };
}
