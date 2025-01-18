{ pkgs, python3, stdenv, lib, fetchFromGitHub, dbus }:

stdenv.mkDerivation rec {
  pname = "slimpris2";
  version = "3.0.4";

  src = fetchFromGitHub {
    owner = "mavit";
    repo = "slimpris2";
    rev = "a04801310dfb2bf3d795ef636af34bea49bb1119";
    sha256 = "sha256-hwiSnFZYpF6oCQ7APlW0e/hdw58OgjBIvDaqgPmKVJ8=";
  };

  outputs = [ "out" "dev" ];

  preConfigure = ''
    ./autogen.sh
  '';

  propagatedBuildInputs = with python3.pkgs; [ pygobject3 pycairo mutagen gst-python feedparser dbus-python simplejson six pyxdg xdg-base-dirs ];

  nativeBuildInputs = with pkgs; [
    autoconf
    automake
    python3
    intltool
    pandoc
    pkg-config
    makeWrapper
    gobject-introspection
    wrapGAppsHook
  ];

  buildInputs = [ dbus pkgs.libsoup ];

  checkPhase = ''
    runHook preCheck
    
    runHook postCheck
  '';

  postInstall = ''
    wrapProgram $out/bin/slimpris2 --set PYTHONPATH $PYTHONPATH
  '';

  # doCheck = false;
  # doInstallCheck = false;

  meta = with lib; {
    description = "slimpris2";
    mainProgram = "slimpris2";
    homepage = "https://github.com/mavit/slimpris2";
    platforms = platforms.linux;
  };
}
