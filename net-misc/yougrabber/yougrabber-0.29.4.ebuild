# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="YouGrabber is a lightweight, multi-threaded command line YouTube video"
HOMEPAGE="http://yougrabber.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/yougrabber-${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
S=${WORKDIR}/yougrabber-${PV}/src
KEYWORDS="~amd64 ~x86"

RDEPEND="net-misc/curl
		sys-libs/ncurses
		dev-libs/glib"
DEPEND="${RDEPEND}
		dev-util/pkgconfig"

src_install() {
	dobin yg || die "dobin failed"
	cd "${WORKDIR}"/${P}
	dodoc README yg.conf.example
}
