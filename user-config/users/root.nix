{ ... }:
{
  users.users.root = {
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIML+uHvahZ4wi5EKGySzJPbnRhIqoOfrNmA2GTrfO+Ug marty@dingo.foo" ];
    extraGroups = [ "pipewire" ];
  };
}
