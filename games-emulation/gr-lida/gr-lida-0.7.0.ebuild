# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"
inherit qt4

MY_P="GR-lida-${PV}"
S="${WORKDIR}"/"${MY_P}"

DESCRIPTION="Frontend for scummvm and dosbox"
HOMEPAGE="http://www.laisladelabandoware.es"
SRC_URI="http://dl.sharesource.org/grlida/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dosbox scummvm"

DEPEND="|| ( ( x11-libs/qt-core:4 x11-libs/qt-gui:4 x11-libs/qt-sql:4 )
	=x11-libs/qt-4.3*:4 )
	dosbox? ( games-emulation/dosbox )
	scummvm? ( games-engines/scummvm )"

QT4_BUILT_WITH_USE_CHECK="gif jpeg png sqlite3"

src_unpack() {
	unpack "${A}"
	cd "${S}"
	epatch "${FILESDIR}/${PN}-stardelegate.patch"
}

src_compile(){
	eqmake4 "${PN}".pro
	emake || die "Compile Failed"
}

src_install(){
	emake INSTALL_ROOT="${D}" install || die "Install Failed"
}

pkg_postinst(){
	einfo "The GUI is by default in Spanish."
	einfo "If you need it, English is available on the Options Menu."
}
