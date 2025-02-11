{ pkgs, ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
  services.printing.drivers = [ pkgs.ptouch-driver ];
  services.printing.enable = true;
  hardware.printers = {
    ensureDefaultPrinter = "Brother_QL-810W";
    ensurePrinters = [{
      deviceUri = "socket://192.168.254.107";
      location = "Home";
      name = "Brother_QL-810W";
      model = "ptouch-driver/Brother-QL-810W-ptouch-ql.ppd.gz";
    }];
  };
}
