# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ API for the Linear Algebra PACKage"
HOMEPAGE="https://github.com/icl-utk-edu/lapackpp"
SRC_URI="https://github.com/icl-utk-edu/lapackpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sci-libs/blaspp
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dbuild_tests=OFF
	)
	cmake_src_configure
}
