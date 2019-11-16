# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Boost::ASIO low-level redis client"
HOMEPAGE="https://github.com/basiliscos/cpp-bredis"
SRC_URI="https://github.com/basiliscos/cpp-bredis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
"

src_install() {
	insinto /usr/include
	doins -r bredis
	dodoc README.md
}
