{ ... }:
{
  imports = [
    ./services/openssh.nix
    ./services/guacamole/guacamole-server.nix
    ./services/guacamole/guacamole-client.nix
    ./services/sunshine.nix
  ];
}
