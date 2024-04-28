{ stdenv
, lib
, fetchFromGitHub
, pkg-config
, meson
, vala
, ninja
, libwnck
, glib
, pcre
, libxml2
, gtk2
, gtk3
, xorg
, cmake
, libxkbcommon
, epoxy
, at-spi2-core
, dbus-glib
, bamf
, libwnck3
, libdbusmenu
, gobject-introspection 
, xfce
, libdbusmenu-gtk2
, libdbusmenu-gtk3
, python39Packages
, wrapGAppsHook
, substituteAll
, callPackage
, dbus
, jayatanaEnable ? false
}:

stdenv.mkDerivation rec {
  pname = "vala-panel-appmenu-plugin";
  version = "24.02";

  src = fetchFromGitHub {
    owner = "rilian-la-te";
    repo = "vala-panel-appmenu";
    rev = version;
    fetchSubmodules = true;
    hash = "sha256-kUmw0fSeRXaXizxvm6gasBXlyKbHRGbcrGKsCA266yQ=";
  };

  nativeBuildInputs = [ 
    pkg-config
    meson
    vala
    ninja
    libxml2.bin
    wrapGAppsHook
    xfce.xfce4-panel
    xfce.libxfce4ui
    xfce.libxfce4util
    xfce.xfconf
  ];

  buildInputs = [
    (callPackage ./appmenu.nix {})
    glib
    libwnck
    gobject-introspection
    libdbusmenu
    gtk2
    gtk3
    libdbusmenu-gtk2
    libdbusmenu-gtk3
    dbus-glib
    dbus
  ] ++ (with xfce;[
    garcon
    
    
  ]) ++ lib.optional jayatanaEnable libxkbcommon;

  mesonBuildType = "release";
  
  mesonFlags = [
    (lib.mesonEnable "xfce" true)
    (lib.mesonEnable "budgie" false)
    (lib.mesonEnable "valapanel" false)
    (lib.mesonEnable "mate" false)
    (lib.mesonEnable "jayatana" jayatanaEnable)
    (lib.mesonEnable "appmenu-gtk-module" true)
    (lib.mesonEnable "auto_features" true)
    "--prefix=/"
  ];

  configurePhase = ''
    mkdir -p $out/lib/xfce4/panel/plugins/
    mkdir -p $out/share/xfce4/panel/plugins/
    meson setup build $src ${lib.concatStringsSep " " mesonFlags}
  '';

  buildPhase = ''
    ninja -C build
  '';

  installPhase = ''
    DESTDIR=$out ninja -C build install
    cp -r $out/${xfce.xfce4-panel}/lib/xfce4/panel/plugins/* $out/lib/xfce4/panel/plugins/
    cp -r $out/${xfce.xfce4-panel}/share/xfce4/panel/plugins/* $out/share/xfce4/panel/plugins/
    rm -rf $out/nix
  '';
  
}