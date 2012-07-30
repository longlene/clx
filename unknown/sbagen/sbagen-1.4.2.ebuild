# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="Command line sequenced binaural beat generator"
HOMEPAGE="http://sbagen.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"

LICENSE="GLP2"
SLOT="0"
KEYWORDS="x86"

IUSE=""

DEPEND=""

src_compile() {

	cd ${S}
	sh ./mk || die "Make failed"
}

src_install() {

	exeinto /usr/bin
	doexe sbagen

	insinto /usr/share/sbagen
	doins *.sbg

	dodoc *.txt
}

