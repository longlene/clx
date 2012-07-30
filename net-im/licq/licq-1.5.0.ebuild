# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"
MY_P="${P/_/-}"
S="${WORKDIR}/${MY_P}"
inherit cmake-utils eutils flag-o-matic

DESCRIPTION="ICQ/Jabber Client"
HOMEPAGE="http://www.licq.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="~x86"
IUSE="debug docs linguas_he nls socks5 ssl xosd aosd jabber qt4 msn ncurses"

RDEPEND=">=app-crypt/gpgme-1
	jabber? ( net-libs/gloox )
	qt4? ( x11-libs/qt-gui:4 )
	docs? ( app-doc/doxygen )
	ssl? ( >=dev-libs/openssl-0.9.5a )
    ncurses? ( sys-libs/ncurses
        dev-libs/cdk )	
	xosd? ( x11-libs/xosd )
	aosd? ( x11-libs/aosd )"
DEPEND="${RDEPEND}
	nls? ( sys-devel/gettext )
	dev-libs/boost"

src_prepare() {
	local licq_plugins="auto-reply rms"
	use ncurses && licq_plugins="${licq_plugins} console"
	use msn && licq_plugins="${licq_plugins} msn"
	use xosd && licq_plugins="${licq_plugins} osd"
	use aosd && licq_plugins="${licq_plugins} aosd"
	use jabber && licq_plugins="${licq_plugins} jabber"
	use qt4 && licq_plugins="${licq_plugins} qt4-gui"

	local plugins=""
	local x
	for x in ${licq_plugins}; do
		plugins="${plugins} ${x}\/CMakeLists.txt"
	done

	sed -i -e "s/file(GLOB cmake_plugins.*$/set(cmake_plugins ${plugins})/" plugins/CMakeLists.txt
}

pkg_setup() {
	filter-ldflags -Wl,--as-needed
	# crutch
	append-flags -pthread
}

src_configure() {

	local myopts="-DCMAKE_BUILD_TYPE=$(use debug && echo 'Debug' || echo 'Release')"
	mycmakeargs="$myopts
		$(cmake-utils_use linguas_he USE_HEBREW)
		$(cmake-utils_use socks5 USE_SOCKS5)
		$(cmake-utils_use ssl USE_OPENSSL)
		$(cmake-utils_use nls ENABLE_NLS)
		-DUSE_FIFO=ON
		-DBUILD_PLUGINS=ON"

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	dodoc README

	docinto doc
	dodoc doc/*

	use ssl && dodoc README.OPENSSL

	exeinto /usr/share/${PN}/upgrade
	doexe upgrade/*.pl || die
}
