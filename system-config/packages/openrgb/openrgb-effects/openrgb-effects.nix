{ lib, stdenv, fetchFromGitLab, qtbase, openrgb, glib, openal, qmake, pkg-config
, wrapQtAppsHook, fetchgit }:

stdenv.mkDerivation (finalAttrs: {
  pname = "openrgb-plugin-effects";
  version = "master";

  # src = fetchFromGitLab {
  #   owner = "OpenRGBDevelopers";
  #   repo = "OpenRGBEffectsPlugin";
  #   rev = "master";
  #   hash = "";
  #   fetchSubmodules = true;
  # };

  src = fetchgit {
    # owner = "OpenRGBDevelopers";
    # repo = "OpenRGBHardwareSyncPlugin";
    url = "https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin.git";
    # rev = "master";
    hash = "sha256-cvzCD1+KpVcz2rRliLlvL0hvLOjK/6wGuLzSAw5FDBA=";
    fetchSubmodules = true;
  };

  postPatch = "\n";

  nativeBuildInputs = [ qmake pkg-config wrapQtAppsHook ];

  buildInputs = [ qtbase glib openal ];

  meta = with lib; {
    homepage = "https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin";
    description = "Effects plugin for OpenRGB";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ fgaz ];
    platforms = platforms.linux;
  };
})
