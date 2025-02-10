{ python3, buildPythonApplication, fetchFromGitLab }:
let
  src = fetchFromGitLab {
    owner = "CoolerControl";
    repo = "CoolerControl";
    rev = "main";
    hash = "sha256-wgxp066mFT593c6TU/x2ZyNeKlcfYjM0RhpX8lIED8g=";
  };
in buildPythonApplication {

  pname = "coolercontrol-liqctld";
  sourceRoot = "${src.name}/coolercontrol-liqctld";
  format = "pyproject";
  version = "master";

  nativeBuildInputs = with python3.pkgs; [ setuptools ];

  propagatedBuildInputs = with python3.pkgs;
    [ setproctitle fastapi uvicorn ]
    ++ [ (pkgs.python3Packages.callPackage ./liquidctl.nix { }) ];

  postInstall = ''
    install -Dm444 "${src}/packaging/systemd/coolercontrol-liqctld.service" -t "$out/lib/systemd/system"
    substituteInPlace "$out/lib/systemd/system/coolercontrol-liqctld.service" \
      --replace-fail '/usr/bin' "$out/bin"
  '';

  meta = {
    description = "(Liquidctl Daemon)";
    mainProgram = "coolercontrol-liqctld";
  };
}
