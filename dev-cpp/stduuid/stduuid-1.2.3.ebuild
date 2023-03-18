# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A cross-platform implementation for UUIDs"
HOMEPAGE="https://github.com/mariusbancila/stduuid"
SRC_URI="https://github.com/mariusbancila/stduuid/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUUID_BUILD_TESTS=OFF
		-DUUID_USING_CXX20_SPAN=ON
	)
	cmake_src_configure
}
