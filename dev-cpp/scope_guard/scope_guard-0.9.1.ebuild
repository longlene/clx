# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/Neargye/scope_guard/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSCOPE_GUARD_OPT_BUILD_EXAMPLES=OFF
		-DSCOPE_GUARD_OPT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
