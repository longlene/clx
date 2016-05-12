# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="Tiny HTTP parser written in C"
HOMEPAGE="https://github.com/h2o/picohttpparser"
SRC_URI=""

EGIT_REPO_URI="https://github.com/h2o/picohttpparser.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} ${PN}.c -Wl,-soname,lib${PN}.so -o lib${PN}.so
}

src_install() {
	dolib.so lib${PN}.so
	insinto /usr/include
	doins ${PN}.h
	dodoc README.md
}
