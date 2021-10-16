# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C/C++ implementation of Ethash and ProgPoW"
HOMEPAGE="https://github.com/chfast/ethash"
SRC_URI="https://github.com/chfast/ethash/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DHUNTER_ENABLED=OFF
		-DETHASH_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
