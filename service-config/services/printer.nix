{ pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
  services.printing.drivers = [ pkgs.ptouch-driver ];
  hardware.printers = {
    ensureDefaultPrinter = "Brother_QL-810W";
    ensurePrinters = [{
      deviceUri = "socket://192.168.254.107";
      location = "Home";
      name = "Brother";
      model = "QL-810W";
    }];
  };
}
