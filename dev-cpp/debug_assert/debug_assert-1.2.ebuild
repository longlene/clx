# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Simple, flexible and modular assertion macro"
HOMEPAGE="https://github.com/foonathan/debug_assert"
SRC_URI="https://github.com/foonathan/debug_assert/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/type_safe
"

src_install() {
	insinto /usr/include
	doins debug_assert.hpp
	dodir /usr/include/type_safe/detail
	dosym /usr/include/debug_assert.hpp /usr/include/type_safe/detail/debug_assert.hpp
	dodoc README.md
}
