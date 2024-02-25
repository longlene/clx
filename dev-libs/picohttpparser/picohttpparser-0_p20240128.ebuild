# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs vcs-snapshot

EGIT_COMMIT="f8d0513f1a7a111f2597d643b073935a8afaf9e5"

DESCRIPTION="Tiny HTTP parser written in C"
HOMEPAGE="https://github.com/h2o/picohttpparser"
SRC_URI="https://github.com/h2o/picohttpparser/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
