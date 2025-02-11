{ ... }: {
  imports = [
    ./services/openssh.nix
    ./services/greetd.nix
    ./services/gnome-keyring.nix
    ./services/guacamole/guacamole-server.nix
    ./services/guacamole/guacamole-client.nix
    ./services/slimpris2/slimpris2.nix
    ./services/gvfs.nix
    ./services/udev.nix
    ./services/squeezelite.nix
    ./services/printer.nix
  ];
}
