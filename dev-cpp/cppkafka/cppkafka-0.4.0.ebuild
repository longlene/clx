# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++11 wrapper for rdkafka"
HOMEPAGE="https://github.com/mfontanini/cppkafka"
SRC_URI="https://github.com/mfontanini/cppkafka/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	>=dev-libs/librdkafka-0.9.1
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DCPPKAFKA_BUILD_SHARED=OFF
	-DCPPKAFKA_RDKAFKA_STATIC_LIB=ON
	-DCPPKAFKA_BOOST_STATIC_LIBS=OFF
	-DCPPKAFKA_DISABLE_EXAMPLES=ON
	-DCPPKAFKA_DISABLE_TESTS=ON
	)
	cmake_src_configure
}
