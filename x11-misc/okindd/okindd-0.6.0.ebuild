# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit qt4

MY_P="${P}-49-20110113"

DESCRIPTION="On Screen Display (OSD) for KDE 4.x - works on any qt desktop"
HOMEPAGE="http://sites.kochkin.org/okindd/Home"
SRC_URI="http://sites.kochkin.org/okindd/Home/development/${MY_P}.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

DEPEND="x11-libs/qt-gui:4
	x11-libs/qt-dbus:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_configure() {
	eqmake4 okindd.pro || die "configure failed"
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"

	dodoc changelog INSTALL || die "dodoc failed"
	docinto examples
	dodoc scripts/* || die "dodoc failed"
	dodoc conf/okinddrc.example || die "dodoc failed"

	elog "You can find an example configuration file at"
	elog "	/usr/share/doc/okindd/examples/okinddrc.example"
	elog "It should be placed in \${HOME}/.okindd/"
}
