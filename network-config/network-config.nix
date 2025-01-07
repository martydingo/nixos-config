{ ... }:
{
  networking = {
    # bridges = {
    #   br0 = {
    #     interfaces = [
    #       "eno1"
    #     ];
    #   };
    # };

    networkmanager = {
      enable = true;
    };

    firewall.enable = false;
    hostName = "desktop";
    hostId = "2b05d929";
  };
}
