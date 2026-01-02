# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C implementation of Amazon Ion"
HOMEPAGE="https://github.com/amzn/ion-c"
SRC_URI="https://github.com/amazon-ion/ion-c/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DIONC_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
