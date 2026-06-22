# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="fbe00da4e030ecc8d1201312bc0b827881bc230d"

DESCRIPTION="C++ AI agent framework with tool-use support from AMD GAIA"
HOMEPAGE="https://github.com/amd/gaia"
SRC_URI="https://github.com/amd/gaia/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/gaia-${COMMIT}/cpp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="ssl"

DEPEND="
	dev-cpp/nlohmann_json
	dev-cpp/cpp-httplib
	ssl? ( dev-libs/openssl:= )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DGAIA_BUILD_TESTS=OFF
		-DGAIA_BUILD_EXAMPLES=OFF
		-DGAIA_BUILD_BENCHMARKS=OFF
		-DGAIA_BUILD_INTEGRATION_TESTS=OFF
		-DGAIA_BUILD_TUI=OFF
		-DGAIA_BUILD_BASH_AGENT=OFF
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
	)
	cmake_src_configure
}
