# Copyright 2007-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools

MY_PV=${PV#1.0_pre}

DESCRIPTION="Port of OpenBSD's free CVS release"
HOMEPAGE="http://www.opencvs.org/"
SRC_URI="http://chl.be/opencvs/opencvs-${MY_PV}.tar.gz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~ppc-macos ~x86-macos"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"
	AT_NOELIBTOOLIZE=yes eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	for manpage in cvs.1 cvs.5; do
		mv src/${manpage} src/open${manpage}
	done
	doman src/*.[1-7]
	dodoc ChangeLog LICENCE README
}
