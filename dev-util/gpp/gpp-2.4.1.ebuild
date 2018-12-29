# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

SRC_URI="http://www.owl-s.org/zip/homepage/${P}.tar.gz"
DESCRIPTION="The Generic PreProcessor"
HOMEPAGE="http://www.owl-s.org/tools.en.html#gpp"
LICENSE="LGPL-2.1"
SLOT="0"

KEYWORDS="~amd64 ~x86"

src_configure() {
	econf --docdir=/usr/share/doc/${PF}
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc AUTHORS BUGS ChangeLog INSTALL NEWS README THANKS TODO
}
