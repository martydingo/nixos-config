{ lib, stdenv, fetchFromGitLab, qmake, wrapQtAppsHook, libusb1, hidapi
, pkg-config, coreutils, mbedtls_2, qtbase, qttools, symlinkJoin, openrgb
, libsForQt5 }:
# nix-repl> let x = libsForQt5.callPackage /etc/nixos/system-config/packages/openrgb/openrgb.nix {}; in builtins.traceVerbose x.qmakeFlags x.qmakeFlags
let
  plugins = [
    (libsForQt5.callPackage ./openrgb-hardwaresync/openrgb-hardwaresync.nix { })
    (libsForQt5.callPackage ./openrgb-effects/openrgb-effects.nix { })
  ];
in stdenv.mkDerivation rec {
  pname = "openrgb";
  version = "master";

  src = fetchFromGitLab {
    owner = "CalcProgrammer1";
    repo = "OpenRGB";
    rev = "master";
    hash = "sha256-8fShbyEplaUTT8XH3x/cClUB+tesIkGRSiNyzIT0ZJA=";
  };

  nativeBuildInputs = [ qmake pkg-config wrapQtAppsHook ];
  buildInputs = [ libusb1 hidapi mbedtls_2 qtbase qttools ];

  postPatch = ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace /bin/chmod "${coreutils}/bin/chmod"
    mkdir -p $out/lib/openrgb
    ln -s ${toString pluginsDir}/lib/openrgb/plugins $out/lib/openrgb/plugins
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    HOME=$TMPDIR $out/bin/openrgb --help > /dev/null
  '';

  pluginsDir = symlinkJoin {
    name = "openrgb-plugins";
    paths = plugins;
    # Remove all library version symlinks except one,
    # or they will result in duplicates in the UI.
    # We leave the one pointing to the actual library, usually the most
    # qualified one (eg. libOpenRGBHardwareSyncPlugin.so.1.0.0).
    postBuild = ''
      for f in $out/lib/*; do
        if [ "$(dirname $(readlink "$f"))" == "." ]; then
          rm "$f"
        fi
      done
    '';
  };

  qmakeFlags = [
    # Welcome to Escape Hell, we have backslashes
    ''
      DEFINES+=OPENRGB_EXTRA_PLUGIN_DIRECTORY=\\\""${
        lib.escape [ "\\" ''"'' " " ] (toString pluginsDir)
      }/lib\\\""''
  ];

  meta = with lib; {
    description = "Open source RGB lighting control";
    homepage = "https://gitlab.com/CalcProgrammer1/OpenRGB";
    maintainers = [ ];
    license = licenses.gpl2Plus;
    platforms = platforms.linux;
    mainProgram = "openrgb";
  };
}
