# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Pidgin plugin that reverses any word on all conversation. "
HOMEPAGE="https://sourceforge.net/projects/convreverse/"
SRC_URI="mirror://sourceforge/convreverse/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="=net-im/pidgin-2*"

src_compile() {
	cd "${PN}"
	econf || die "could not configure"
	emake || die "emake fail"
}

src_install() {
	cd "${PN}"
	emake install DESTDIR="${D}" || die "install fail"
	dodoc AUTHORS INSTALL ChangeLog
	prepallstrip
}


