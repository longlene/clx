# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

MY_PV=${PV/./}

DESCRIPTION="HA-archiver, an arithmetic/Markov coder."
HOMEPAGE="I HAVE NO HOME!"
SRC_URI="ftp://sunsite.unc.edu/pub/Linux/utils/compress/${PN}${MY_PV}-linux.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	rm -f "${WORKDIR}"/makefile
	mv "${WORKDIR}"/grr/{Makefile,machine.h} "${WORKDIR}"
}

src_compile() {
	emake ha CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" || die "emake failed"
}

src_install() {
	dobin ha
	dodoc README
}
