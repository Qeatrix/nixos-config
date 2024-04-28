{ stdenv
, fetchFromGitHub
, meson
, vala
, glib
, pkg-config
, ninja
, gtk2
, gtk3
, gtk-doc
, docbook-xsl-nons
, wrapGAppsHook
, lib
}:
stdenv.mkDerivation rec {
  pname = "vala-panel-appmenu-xfce";
  version = "24.02";

  src = "${fetchFromGitHub {
    owner = "rilian-la-te";
    repo = "vala-panel-appmenu";
    rev = version;
    fetchSubmodules = true;

    hash = "sha256-kUmw0fSeRXaXizxvm6gasBXlyKbHRGbcrGKsCA266yQ=";
  }}/subprojects/appmenu-gtk-module";

  nativeBuildInputs = [
    ninja
    pkg-config
    meson
    vala
    gtk-doc
    wrapGAppsHook
    docbook-xsl-nons
    glib
  ];
  buildInputs = [
    gtk2
    gtk3
  ];

  mesonFlags = [
    "--prefix=/"
  ];

  configurePhase = ''
    meson setup build $src ${lib.concatStringsSep " " mesonFlags}
  '';

  buildPhase = ''
    ninja -C build
  '';

  installPhase = ''
    DESTDIR=$out ninja -C build install
  '';
}