# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A C++ smart-pointer with value-semantics"
HOMEPAGE="https://github.com/LoopPerfect/valuable"
SRC_URI="https://github.com/LoopPerfect/valuable/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/valuable
	doins valuable/include/value-ptr.hpp
	dodoc README.md
}
