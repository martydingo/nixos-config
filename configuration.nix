{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./boot-config/boot-config.nix
      ./hardware-config/hardware-config.nix
      ./network-config/network-config.nix
      ./service-config/service-config.nix
      ./system-config/system-config.nix
      ./user-config/user-config.nix
      ./program-config/program-config.nix
    ];

  hardware.display.edid = {
    enable = true;
    packages = [
      (pkgs.runCommand "evanlak8k" { } ''
        mkdir -p "$out/lib/firmware/edid"
        base64 -d > "$out/lib/firmware/edid/custom1.bin" <<'EOF'
        AP///////wAkZIx1AQAAAC0gAQOAPyR4KuoVrFBFnyYOUFS/74DRwIHAlQCBgKnAswABAQEBCOgAMPJwWoCwWIoAeGghAAAe53xwoNCgKVAwIDoAIE8xAAAaAAAA/QAelh6gjAAKICAgICAgAAAA/ABFdmFubGFrOEsgVjEKAtMCA2DyUiAiHxBAP11fYGF1dmJkZWba2yMJBweDAQAA4wXjAWwDDAAgADj/IABAAQJt2F3EAf/AMwswlsM0DG0aAAACATCW5gAAAAAA4w8YfOYGBwFgYCfiANXlDsR+ZttwwgCgoKBVUDAgNQB4aCEAAB4AAAAAAAAAAAAAAAAArg==
        EOF
      '')
    ];
  };

  system.stateVersion = "24.11";
}

