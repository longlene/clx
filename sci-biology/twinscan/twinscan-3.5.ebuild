# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A gene structure prediction pipeline"
LICENSE="twinscan"
HOMEPAGE="http://mblab.wustl.edu/software/twinscan"
SLOT="0"
IUSE=""
KEYWORDS="~x86 ~amd64"
SRC_URI="http://mblab.wustl.edu/software/download/Twinscan_${PV}_src.tar.gz"
S="${WORKDIR}/Twinscan_${PV}_src"

RDEPEND="sci-biology/repeatmasker"

# This code used to be needed to fetch
# cd /usr/portage/distfiles; wget --user-agent="anonymous" --post-data 'read_license=I%20Agree' ${SRC_URI}"

src_unpack() {
	unpack ${A}
	sed -i "s|\(use strict;\)|\1\nuse lib \"/usr/share/${PN}/lib\";|" "${S}"/bin/*.pl
}

src_install() {
	dobin "${S}/bin/iscan"
	dobin "${S}/bin/"*".pl"
	dodir /usr/share/${PN}/profiles
	insinto /usr/share/${PN}/profiles
	doins "${S}/parameters/"*
	dodir /usr/share/${PN}/lib
	insinto /usr/share/${PN}/lib
	doins "${S}/lib/"*".pm"
	dodoc README
}
