# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit autotools

DESCRIPTION="Radar Software Library"
HOMEPAGE="http://trmm-fc.gsfc.nasa.gov/trmm_gv/software/rsl/index.html"
SRC_URI="ftp://trmm-fc.gsfc.nasa.gov/software/${PN}-v${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="sci-libs/hdf
	media-libs/jpeg"
DEPEND="${RDEPEND}"

S="${WORKDIR}/rsl-v${PV}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${PN}-warnings.patch"
	epatch "${FILESDIR}/${PN}-automake.patch"
	epatch "${FILESDIR}/${PN}-type_str.patch"
	epatch "${FILESDIR}/${PN}-valgrind.patch"
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README CHANGES || die
}
