# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit toolchain-funcs

DESCRIPTION="SPHERE Conversion Tools"
HOMEPAGE="https://www.ldc.upenn.edu/language-resources/tools/sphere-conversion-tools"
SRC_URI="https://www.ldc.upenn.edu/sites/www.ldc.upenn.edu/files/ctools/sph2pipe_v${PV}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}_v${PV}

src_compile() {
	$(tc-getCC) -o ${PN} *.c -lm
}

src_install() {
	dobin ${PN}
	dodoc 0readme.1st
}
