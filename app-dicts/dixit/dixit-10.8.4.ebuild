# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

RESTRICT="primaryuri"

EAPI="2"
inherit eutils qt4

DESCRIPTION="Romanian Definitions Dictionary"
HOMEPAGE="http://dixit.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz
         mirror://sourceforge/${PN}/${PN}.qdb.tar.bz2"

LICENSE="GPL-3 LPGL-2.1 as-is"
SLOT="0"
KEYWORDS="amd64 x86 ~alpha hppa ~ia64 ~ppc64"
IUSE="doc"

RDEPEND="x11-libs/qt-core:4
	 x11-libs/qt-gui:4
	 sys-libs/zlib"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${PN}

src_unpack() {
	unpack ${P}.tgz
	unpack ${PN}.qdb.tar.bz2
}

src_compile() {
	eqmake4 ${PN}.pro || die "qmake failed"
	emake || die "emake failed"
}

src_install() {
	dobin ${PN} || die "installing binary failed"

	domenu "${FILESDIR}"/${PN}.desktop || die "registering application failed"
	doicon images/${PN}.ico || die "configuring icon failed"

	dodir /var/lib/${PN}
	insinto /var/lib/${PN}
	doins ${PN}.qdb || die "initializing database failed"
	fperms 0666 /var/lib/${PN}/${PN}.qdb

	use doc || return
	dodoc Readme || die "installing minimal documentation failed"
	dohtml html/* || die "installing verbose documentation failed"
}

pkg_postinst() {
	ewarn
	ewarn "Dictionary has been put in \"/var/lib/${PN}/${PN}.qdb\"!"
	ewarn "Any user can update it by running \`dixit'!"
	ewarn

	einfo
	einfo "Launch as \`dixit /var/lib/${PN}/dixit.qdb' in command-line or"
	einfo "use a GUI to open the desktop application file instead."
	einfo

	use doc || return
	elog "Access documentation from \"/usr/share/doc/${PF}/html/\""
}
