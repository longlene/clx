# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit toolchain-funcs

MY_PV=${PV//./}

DESCRIPTION="An Embeddable Datastore Engine"
HOMEPAGE="https://vedis.symisc.net"
SRC_URI="http://vedis.symisc.net/db/vedis-ds-${MY_PV}.zip"

LICENSE="Sleepycat"
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
	doins vedis.h
	dolib.so lib${PN}.so
}
