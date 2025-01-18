{ pkgs, ... }:
{
  systemd.user.services.slimpris2 = {
    enable = true;
    description = "slimpris2";
    # environment = {
    # };
    serviceConfig = {
      ExecStart = "${(pkgs.callPackage ./packages/slimpris2.nix { })}/bin/slimpris2 NAS 9000 \"Office PC\"";
      Restart = "always";
      Type = "simple";
    };
    wantedBy = [ "default.target" ];
  };

}
