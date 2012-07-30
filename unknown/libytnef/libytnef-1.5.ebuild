# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="libytnef is used in ytnef, program to work with procmail to decode TNEF streams (winmail.dat attachments)"
HOMEPAGE="http://ytnef.sourceforge.net/"
SRC_URI="mirror://sourceforge/ytnef/libytnef-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/libc"
RDEPEND=""

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make install DESTDIR=${D} || die "make install failed"

	dodoc COPYING INSTALL
}

pkg_postinst() {
	einfo "${P} was successfully installed."
	einfo "Please read the associated docs for help."
	einfo "Or visit the website @ ${HOMEPAGE}"
	echo
}
