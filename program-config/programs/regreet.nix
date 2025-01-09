{ inputs, pkgs, ... }:
{
  programs.regreet = {
    enable = true;
    package = pkgs.greetd.regreet;
    theme = {
      name = "Gruvbox-Material-Dark";
      package = inputs.nixpkgs-unstable.outputs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pkgs.gruvbox-material-gtk-theme;
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox) 32";
      package = inputs.nixpkgs-unstable.outputs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.capitaine-cursors-themed;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = inputs.nixpkgs-unstable.outputs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.gruvbox-plus-icons;
    };
  };
  settings = {
    background.path = "/home/marty/Pictures/Wallpapers/5120x1440wallpaper_51202149947_o.png";
    env = {
      XCURSOR_THEME = "Capitaine Cursors (Gruvbox)";
      XCURSOR_SIZE = "32";
      HYPRCURSOR_THEME = "Capitaine Cursors (Gruvbox)";
      HYPRCURSOR_SIZE = "32";
    };
  };
}
