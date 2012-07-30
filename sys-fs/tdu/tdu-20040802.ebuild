# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a text-mode disk usage visualization utility"
HOMEPAGE="http://dse.webonastick.com/tdu/"
SRC_URI="http://dse.webonastick.com/${PN}/${PN}-2004-08-02.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-libs/ncurses-5"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
