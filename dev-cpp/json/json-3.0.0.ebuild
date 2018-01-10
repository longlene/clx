# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="JSON for Modern C++"
HOMEPAGE="http://nlohmann.github.io/json"
SRC_URI="https://github.com/nlohmann/json/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile(){
	:
}

src_install() {
	insinto /usr/include
	doins src/json.hpp
	dodoc README.md
}
