# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An opensource C++ library develop in Qihoo infrastructure team"
HOMEPAGE="https://github.com/Qihoo360/slash"
SRC_URI="https://github.com/Qihoo360/slash/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake -C slash
}

src_install() {
	insinto /usr/include/slash
	doins -r slash/include
	dolib.a slash/lib/lib${PN}.a
	dodoc README.md
}
