# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..11} )

inherit eutils python-any-r1 scons-utils flag-o-matic desktop xdg-utils

DESCRIPTION="Multi-platform 2D and 3D game engine"
HOMEPAGE="http://godotengine.org"
LICENSE="MIT"
SLOT="0"

if [[ ${PV} = 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/godotengine/${PN}"
	EGIT_BRANCH="master"
else
	SRC_URI="https://github.com/godotengine/${PN}/archive/${PV}-stable.tar.gz -> ${P}-stable.tar.gz"
	S="${WORKDIR}/${P}-stable"
	KEYWORDS="~amd64 ~x86"
fi

IUSE="debug lto pulseaudio udev"

DEPEND="
	>=app-arch/bzip2-1.0.6-r6
	>=app-arch/lz4-0_p120
	>=app-arch/xz-utils-5.0.8
	>=dev-libs/json-c-0.11-r1
	dev-libs/libpcre2[pcre32]
	>=media-libs/alsa-lib-1.0.28
	media-libs/embree:3
	>=media-libs/flac-1.3.1-r1
	>=media-libs/libogg-1.3.1
	>=media-libs/libsndfile-1.0.25-r1
	media-libs/libvpx
	>=media-libs/mesa-10.2.8[gles2]
	media-libs/libwebp
	media-libs/opusfile
	net-libs/enet
	>=net-libs/libasyncns-0.8-r3
	net-libs/libwebsockets
	net-libs/mbedtls
	net-libs/miniupnpc
	sci-physics/bullet
	>=sys-apps/attr-2.4.47-r1
	>=sys-apps/tcp-wrappers-7.6.22-r1
	>=sys-apps/util-linux-2.25.2-r2
	>=sys-libs/gdbm-1.11
	>=sys-libs/glibc-2.20-r2
	>=sys-libs/libcap-2.22-r2
	>=sys-libs/zlib-1.2.8-r1
	>=x11-libs/libX11-1.6.2
	>=x11-libs/libXcursor-1.1.14
	>=x11-libs/libXinerama-1.1.3
	>=media-libs/freetype-2.5.3-r1:2
	>=media-libs/libpng-1.6.16:0=
	pulseaudio? ( >=media-sound/pulseaudio-5.0-r7 )
	media-libs/libtheora
	udev? ( virtual/udev )
	virtual/glu
	>=media-libs/libvorbis-1.3.4
"

RDEPEND="${DEPEND}"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_configure() {
	MYSCONS=(
		CC="$(tc-getCC)"
		platform=x11
		target=$(usex debug debug release_debug)
		builtin_bullet=no
		builtin_embree=no
		builtin_enet=no
		builtin_freetype=no
		builtin_libogg=no
		builtin_libpng=no
		builtin_libtheora=no
		builtin_libvorbis=no
		builtin_libvpx=no
		builtin_libwebp=no
		builtin_mbedtls=no
		builtin_miniupnpc=no
		builtin_opus=no
		builtin_pcre2=no
		builtin_zlib=no
		builtin_zstd=no
		tools=yes
		progress=false
		verbose=true
		colored=yes
		pulseaudio=$(usex pulseaudio)
		udev=$(usex udev)
		use_static_cpp=false
		use_lto=$(usex lto)
	)
}

src_compile() {
	escons "${MYSCONS[@]}"
}

src_install() {
	newicon icon.svg ${PN}.svg
	newbin bin/godot.* godot
	domenu misc/dist/linux/org.godotengine.Godot.desktop
	doman misc/dist/linux/godot.6
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
