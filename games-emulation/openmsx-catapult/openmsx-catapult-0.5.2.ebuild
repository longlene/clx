# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic games wxwidgets

DESCRIPTION="Catapult, the (optional) GUI for openMSX"
HOMEPAGE="http://openmsx.sourceforge.net/"
SRC_URI="mirror://sourceforge/openmsx/${P}-R2.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE="" 
DEPEND="dev-libs/libxml2
		games-emulation/openmsx
		>=x11-libs/wxGTK-2.6.0"

S="${WORKDIR}/${P}-R2"

pkg_setup() {
	export WX_GTK_VER="2.6"
	export WX_CONFIG="wx-config-2.6"
	need-wxwidgets gtk2
}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/${PV}-R2-custom.mk.patch"
	epatch "${FILESDIR}/${PV}-R2-main.mk.patch"
}

src_compile() {
	emake || die "make failed"
}

src_install() {
	egamesinstall \
		CATAPULT_INSTALL="${D}/usr/games/openmsx" \
		DESKTOP_HOOKS_DIR="${D}/usr/share/applications" \
		|| die "install failed"

	dogamesbin ${D}/usr/games/openmsx/bin/catapult
}
