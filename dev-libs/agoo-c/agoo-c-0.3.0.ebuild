# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Agoo webserver in C"
HOMEPAGE="https://github.com/ohler55/agoo-c"
SRC_URI="https://github.com/ohler55/agoo-c/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	emake -C src
}

src_install() {
	insinto /usr/include
	doins src/agoo.h
	insinto /usr/include/agoo
	doins src/agoo/*.h
	dolib.a lib/libagoo.a
	dodoc README.md
}
