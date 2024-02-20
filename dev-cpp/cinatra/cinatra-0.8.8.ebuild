# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit cmake

DESCRIPTION="modern c++, cross-platform, header-only, easy to use http framework"
HOMEPAGE="https://github.com/qicosmos/cinatra"
SRC_URI="https://github.com/qicosmos/cinatra/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	|| ( dev-libs/boost[context] dev-libs/asio )
"
RDEPEND="${DEPEND}"

#src_configure() {
#	local mycmakeargs=(
#		-DBUILD_EXAMPLES=OFF
#		-DBUILD_BENCHMARK=OFF
#		-DBUILD_UNIT_TESTS=OFF
#	)
#	cmake_src_configure
#}

src_install() {
	insinto /usr/include
	doins -r include/cinatra{,.hpp}
	einstalldocs
}
