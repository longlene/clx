# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A high performance network library"
HOMEPAGE="https://github.com/Qihoo360/pink"
SRC_URI="https://github.com/Qihoo360/pink/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-cpp/slash"
RDEPEND="${DEPEND}"

src_compile() {
	emake -C pink
}

src_install() {
	insinto /usr/include/pink
	doins -r pink/include
	dolib.a pink/lib/libpink.a
	dodoc README.md
}

