# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="6454a1f9336bd89b23661fea249a72a3e7fc51d2"

DESCRIPTION="Constexpr-first C++20 header library: STL containers that work at compile time"
HOMEPAGE="https://github.com/zokrezyl/ycetl"
SRC_URI="https://github.com/zokrezyl/ycetl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Headers include <ytrace/ytrace.hpp>
RDEPEND="dev-cpp/ytrace"

src_configure() { :; }
src_compile()   { :; }

src_install() {
	insinto /usr/include
	doins -r include/ycetl
	dodoc README.md
}
