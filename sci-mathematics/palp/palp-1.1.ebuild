# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A Package for Analyzing Lattice Polytopes"
HOMEPAGE="http://hep.itp.tuwien.ac.at/%7Ekreuzer/CY/CYpalp.html"
SRC_URI="http://hep.itp.tuwien.ac.at/%7Ekreuzer/CY/palp/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64 ~ppc64"
RESTRICT="mirror"
IUSE=""

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}

	cd ${S}
	sed -i s/"CFLAGS=-O3 -g -W -Wall"/"CFLAGS=${CFLAGS}"/ GNUmakefile
}

src_compile() {
	cd ${S}

	emake || die "make failed"
}

src_install() {
	dobin *.x
}