# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit toolchain-funcs

DESCRIPTION="David Lowe's SIFT keypoint detector"
HOMEPAGE="http://www.cs.ubc.ca/~lowe/keypoints/"
MY_P=${PN}DemoV${PV}
SRC_URI="http://www.cs.ubc.ca/~lowe/keypoints/${MY_P}.zip"

LICENSE="${PN}"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_compile() {
	emake CC=$(tc-getCC) CFLAGS="${CFLAGS}" || die
}

src_install() {
	dobin match ${PN} || die
	dodoc README || die
	if use examples ; then
		docinto examples
		dodoc *.{pgm,m} || die
	fi
}
