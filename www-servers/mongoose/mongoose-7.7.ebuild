# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Mongoose Embedded Web Server Library"
HOMEPAGE="https://github.com/cesanta/mongoose"
SRC_URI="https://github.com/cesanta/mongoose/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc"

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -shared -o lib${PN}.so mongoose.c
}

src_install() {
	dolib.so lib${PN}.so
	insinto /usr/include
	doins mongoose.h
	dodoc README.md
	use doc && dodoc -r docs examples
}
