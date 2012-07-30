# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Creates static HTML album pages and images pages recursively"
HOMEPAGE="http://galleryforge.berlios.de/"
SRC_URI="http://download.berlios.de/galleryforge/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
RESTRICT="nomirror"
IUSE="wxwindows"

DEPEND=">=dev-python/imaging-1.1.4-r1
	>=dev-lang/python-2.4.0
	wxwindows? ( >=dev-python/wxpython-2.6.0 )"
RDEPEND="${DEPEND}"


src_unpack() {
	unpack ${A}
	cd ${S}
}


src_install() {
	python install.py ${D}

	dosym ${D}/opt/${PN}/bin/${PN}.py /opt/bin/${PN}
	dosym ${D}/opt/${PN}/bin/${PN}-gui.py /opt/bin/${PN}-gui
}
