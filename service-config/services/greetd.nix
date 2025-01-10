{ config, pkgs, ... }:
let
  hyprlandConfig = pkgs.writeText "greetd-hyprland-config" ''
      input {
        accel_profile=adaptive
        follow_mouse=1
        kb_layout=us
        kb_model=hhk
        sensitivity=-1
      }
      decoration {
        blur {
          enabled=true
          new_optimizations=true
          passes=4
          size=12
        }

        shadow {
          color=rgb(000000)
          enabled=true
          range=30
          render_power=4
        }
        rounding=15
    }
    exec-once = ${config.programs.regreet.package}/bin/regreet; hyprctl dispatch exit

  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprlandConfig}";
      };
    };

  };
  security.pam.services.greetd.enableGnomeKeyring = true;
}
