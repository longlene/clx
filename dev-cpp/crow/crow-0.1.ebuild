# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Crow is very fast and easy to use C++ micro web framework"
HOMEPAGE="https://github.com/ipkn/crow"
SRC_URI="https://github.com/ipkn/crow/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/boost
dev-util/google-perftools
"

src_install() {
	insinto /usr/include
	doins -r include/crow{,.h}
	dodoc README.md
}
