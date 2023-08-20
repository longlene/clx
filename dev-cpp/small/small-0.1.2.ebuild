# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ small containers"
HOMEPAGE="https://github.com/alandefreitas/small"
SRC_URI="https://github.com/alandefreitas/small/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSMALL_DEV_BUILD=OFF
		-DSMALL_BUILD_EXAMPLES=OFF
		-DSMALL_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
