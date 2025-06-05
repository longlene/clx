# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C++20 library for sequence-orientated programming"
HOMEPAGE="
	https://github.com/tcbrindle/flux
	https://tristanbrindle.com/flux/
"
SRC_URI="https://github.com/tcbrindle/flux/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DFLUX_BUILD_EXAMPLES=OFF
		-DFLUX_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
