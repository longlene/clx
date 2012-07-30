# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


inherit eutils

MY_PN="boost-numeric-bindings"
DESCRIPTION="Boost UBLAS numeric bindings"
HOMEPAGE="http://mathema.tician.de/software/${MY_PN}"
#SRC_URI="http://mathema.tician.de/news.tiker.net/download/software/${MY_PN}/${MY_PN}-${PV}.tar.gz"
SRC_URI="http://aeminium.org/slug/software/gentoo/${MY_PN}/${MY_PN}-${PV}.tar.bz2"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="boost? ( >=dev-libs/boost-1.35.0 )"

RDEPEND="${DEPEND}"

#S="${WORKDIR}/${MY_PN}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
