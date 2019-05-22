# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs vcs-snapshot

DESCRIPTION="An Embedded Computer Vision & Machine Learning Library"
HOMEPAGE="https://sod.pixlab.io/"
SRC_URI="https://github.com/symisc/sod/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} sod.c -Wl,-soname,lib${PN}.so -o lib${PN}.so
}

src_install() {
	dolib.so libsod.so
	insinto /usr/include
	doins sod.h
	dodoc README.md
}
