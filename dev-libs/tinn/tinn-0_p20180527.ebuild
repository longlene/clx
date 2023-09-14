# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs vcs-snapshot

EGIT_COMMIT="5e44c332076674827e541820f39aa3c6231aa687"

DESCRIPTION="The tiny neural network library"
HOMEPAGE="https://github.com/glouw/tinn"
SRC_URI="https://github.com/glouw/tinn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} Tinn.c -Wl,-soname,lib${PN}.so -o lib${PN}.so
}

src_install() {
	insinto /usr/include
	doins Tinn.h
	dolib.so lib${PN}.so
	dodoc README.md
}
