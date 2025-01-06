{ ... }:
{
  users.users.marty = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$/J2nu..BiZMB4Dm7rNH8i1$KWL5yNxwq6nyjEDGi29XOspD4AabkPDZPEys2.4jvR/";
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE0oSUxUlXgYfTGO6jwMPAMInkilYDzk1x6nkyRNfIXi marty@dingo.management" ];
    extraGroups = [ "wheel" "pipewire" "input" "fuse" "video" "docker" "tty" ];
  };
  security.sudo.extraRules = [
    {
      users = [ "marty" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
