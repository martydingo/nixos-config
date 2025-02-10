{ lib, stdenv, fetchFromGitLab, qtbase, openrgb, glib, libgtop, lm_sensors
, qmake, pkg-config, wrapQtAppsHook, git, curl, nlohmann_json, fetchgit }:

stdenv.mkDerivation (finalAttrs: {
  pname = "openrgb-plugin-hardwaresync";
  version = "master";

  src = fetchgit {
    # owner = "OpenRGBDevelopers";
    # repo = "OpenRGBHardwareSyncPlugin";
    url = "https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin.git";
    # rev = "master";
    hash = "sha256-yOCFu7+ewKnBCkkIPmw/tS201Bdwv8G0vSlEuAZ5eE0=";
    fetchSubmodules = true;
  };
  patchPhase = ''
    cp ${./json.hpp} ./json.hpp
  '';

  postPatch = ''
    ## Remove prebuilt stuff
    rm -r dependencies/lhwm-cpp-wrapper
  '';

  propagatedBuildInputs = [ nlohmann_json ];
  buildInputs = [ qtbase glib libgtop lm_sensors git curl ];

  nativeBuildInputs = [ qmake pkg-config wrapQtAppsHook ];

  meta = with lib; {
    homepage = "https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin";
    description =
      "Sync your ARGB devices colors with hardware measures (CPU, GPU, fan speed, etc...)";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ fgaz ];
    platforms = platforms.linux;
  };
})
