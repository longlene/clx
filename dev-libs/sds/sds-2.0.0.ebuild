# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Simple Dynamic Strings library for C"
HOMEPAGE="https://github.com/antirez/sds"
SRC_URI="https://github.com/antirez/sds/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} sds.c -Wl,-soname,lib${PN}.so -o lib${PN}.so
}

src_install() {
	dolib.so *.so
	insinto /usr/include
	doins sds.h
	dodoc README.md
}

