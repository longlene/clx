# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Ultra-fast and intuitive C++ JSON reader/writer with yyjson backend"
HOMEPAGE="https://github.com/yosh-matsuda/cpp-yyjson"
SRC_URI="https://github.com/yosh-matsuda/cpp-yyjson/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/yyjson
	dev-libs/libfmt
	dev-cpp/nameof
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DCPPYYJSON_BUILD_TEST=OFF
	)
	cmake_src_configure
}
