# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A fast, small, safe, gradually typed embeddable scripting language derived from Lua"
HOMEPAGE="https://luau-lang.org/"
SRC_URI="https://github.com/Roblox/luau/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DLUAU_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/{luau,luau-analyze}
	dodoc README.md
}
