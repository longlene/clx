# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A blazing fast and lightweight C asymmetric coroutine library"
HOMEPAGE="https://github.com/hnes/libaco"
SRC_URI="https://github.com/hnes/libaco/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} aco.c acosw.S -Wl,-soname,${PN}.so -o ${PN}.so
}

src_install() {
	dolib.so libaco.so
	insinto /usr/include
	doins aco.h
	dodoc README.md
}
