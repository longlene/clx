# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A Template Engine for Modern C++"
HOMEPAGE="https://pantor.github.io/inja/"
SRC_URI="https://github.com/pantor/inja/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-json"

DEPEND="
	system-json? ( dev-cpp/nlohmann_json )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DINJA_USE_EMBEDDED_JSON=$(usex ! system-json)
	-DBUILD_TESTING=OFF
	-DBUILD_BENCHMARK=OFF
	)
	cmake-utils_src_configure
}
