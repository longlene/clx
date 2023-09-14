# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PATCH_LEVEL=3
DEB_PF="${PN}_${PV}-${PATCH_LEVEL}"

inherit eutils

DESCRIPTION="CSS parser and optimiser"
HOMEPAGE="http://csstidy.sourceforge.net/"
SRC_URI="mirror://debian/pool/main/c/csstidy/${PN}_${PV}.orig.tar.gz
		 mirror://debian/pool/main/c/csstidy/${DEB_PF}.diff.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-util/scons"
RDEPEND=""

src_prepare() {
	epatch "${WORKDIR}"/${DEB_PF}.diff
	epatch */debian/patches/*.dpatch
}

src_compile() {
	scons ${MAKEOPTS} || die
}

src_install() {
	dobin release/csstidy/csstidy
	doman */debian/csstidy.1
	dodoc AUTHORS BUGS ChangeLog NEWS README TODO
}
