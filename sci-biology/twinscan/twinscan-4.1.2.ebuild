# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A gene structure prediction pipeline"
LICENSE="as-is"
HOMEPAGE="http://mblab.wustl.edu/software/twinscan"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~amd64"
SRC_URI="http://mblab.wustl.edu/software/download/iscan-${PV}.tar_.gz"

S="${WORKDIR}/N-SCAN"

RDEPEND="sci-biology/repeatmasker"

src_unpack() {
	unpack ${A}
	tar -C "${WORKDIR}" -xf iscan-${PV}.tar_
	sed -i "s|\(use strict;\)|\1\nuse lib \"/usr/share/${PN}/lib/perl5\";|" "${S}"/bin/*.pl || die
}

src_install() {
	dobin "${S}/bin/iscan"
	dobin "${S}/bin/"*".pl"
	insinto /usr/share/${PN}
	doins -r "${S}/parameters"
	doins -r "${S}/lib"
	dodoc examples/* README*
}
