{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  #24.11 
  hardware.graphics.extraPackages = with pkgs; [ amdvlk ];
  # For 32 bit applications 
  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

}
