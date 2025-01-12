# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Expressive Vector Engine"
HOMEPAGE="https://github.com/jfalcou/eve"
SRC_URI="https://github.com/jfalcou/eve/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/eve-install.patch
)

src_configure() {
	local mycmakeargs=(
		-DEVE_USE_PCH=OFF
		-DEVE_BUILD_TEST=OFF
		-DEVE_BUILD_DOCUMENTATION=OFF
	)
	cmake_src_configure
}
