# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="network traffic statics utility for Solaris and Linux"
HOMEPAGE="https://sourceforge.net/projects/nicstat/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	$(tc-getCC) ${CFLAGS} ${PN}.c -o ${PN} ${LDFLAGS} || die
}

src_install() {
	dobin {e,}${PN}
	doman ${PN}.1
	dodoc README.txt ChangeLog.txt
}
