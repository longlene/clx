# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"

inherit cmake-utils eutils python subversion

DESCRIPTION="An OpenGL interface library"
HOMEPAGE="http://gigi.sourceforge.net"
ESVN_REPO_URI="https://${PN}.svn.sourceforge.net/svnroot/${PN}/trunk"
ESVN_PROJECT="${PN}"
ESVN_REVISION="${PV#*_pre}"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="" # keywords removed due to fragile nature of this package
IUSE="devil doc eve ogre ois sdl static-libs threads"
RESTRICT="test" # fails for unknown reasons

RDEPEND="
	>=dev-libs/boost-1.47
	media-libs/freetype:2
	sys-devel/libtool
	sys-libs/zlib
	x11-libs/libX11
	virtual/opengl
	devil? ( >=media-libs/devil-1.6.1 )
	!devil? (
		media-libs/libpng:0
		media-libs/tiff:0
		virtual/jpeg
	)
	ogre? (
		>=dev-games/ogre-1.7.4[ois?]
		ois? ( dev-games/ois )
	)
	sdl? ( media-libs/libsdl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( app-doc/doxygen )"
REQUIRED_USE="ois? ( ogre )"

CMAKE_USE_DIR="${S}"/GG
CMAKE_VERBOSE="1"

pkg_setup() {
	ewarn "${PN} needs about 4GB of memory for compilation and"
	ewarn "may even then swap out heavily."
	ewarn ""
	ewarn "If you get segfault during build time try disabling debug"
	ewarn "compiler flags https://qa.mandriva.com/show_bug.cgi?id=62558"
	ewarn "If that fails too consider retrying with gcc:4.4"

	sleep 5
	python_pkg_setup
}

src_prepare() {
	# fix docdir
	epatch "${FILESDIR}"/${P}-docdir.patch

	# use systems ltdl
	rm -r "${CMAKE_USE_DIR}"/libltdl || die
	epatch "${FILESDIR}"/${P}-libtool.patch

	# fix devil (apply after libtool.patch)
	epatch "${FILESDIR}"/${P}-devil.patch

	python_convert_shebangs 2 GG/GG/gen_signals.py
}

src_configure() {
	# USE_DEVIL broken
	# BUILD_TUTORIALS incomplete
	local mycmakeargs=(
		-DDOCDIR=/usr/share/doc/${PF}/html
		-DRELEASE_COMPILE_FLAGS=""
		$(cmake-utils_use_use devil DEVIL)
		$(cmake-utils_use_build eve EXPERIMENTAL_EVE_SUPPORT)
		$(cmake-utils_use_build ogre OGRE_DRIVER)
		$(cmake-utils_use_build ois OGRE_OIS_PLUGIN)
		$(cmake-utils_use_build sdl SDL_DRIVER)
		$(cmake-utils_use_build doc DOCUMENTATION)
		$(cmake-utils_use_build static-libs STATIC)
		$(cmake-utils_use_build threads MULTI_THREADED)
	)

	cmake-utils_src_configure
}
