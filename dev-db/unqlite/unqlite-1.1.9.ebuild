# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="An Embeddable NoSQL Database Engine"
HOMEPAGE="https://unqlite.org"
SRC_URI="https://github.com/symisc/unqlite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -fPIC -shared -Wl,-soname,lib${PN}.so -o lib${PN}.so ${PN}.c
}

src_install() {
	insinto /usr/include
	doins ${PN}.h
	dolib.so lib${PN}.so
}
