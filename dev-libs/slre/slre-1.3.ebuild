# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit toolchain-funcs

DESCRIPTION="Super Light Regexp engine for C/C++"
HOMEPAGE="https://github.com/cesanta/slre"
SRC_URI="https://github.com/cesanta/slre/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -fPIC -shared -o lib${PN}.so -Wl,-soname,lib${PN}.so ${PN}.c
}

src_install() {
	insinto /usr/include
	doins slre.h
	dolib.so lib${PN}.so
	dodoc README.md
}
