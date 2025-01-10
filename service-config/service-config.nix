{ ... }:
{
  imports = [
    ./services/openssh.nix
    ./services/greetd.nix
    ./services/gnome-keyring.nix
    ./services/guacamole/guacamole-server.nix
    ./services/guacamole/guacamole-client.nix
  ];
}
