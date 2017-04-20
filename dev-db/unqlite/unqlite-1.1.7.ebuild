# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs

MY_PV=${PV//./}

DESCRIPTION="An Embeddable NoSQL Database Engine"
HOMEPAGE="https://unqlite.org"
SRC_URI="https://unqlite.org/db/unqlite-db-${MY_PV}.zip"

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
