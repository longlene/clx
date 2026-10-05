# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Header-only C++17 Unicode library"
HOMEPAGE="https://github.com/yhirose/cpp-unicodelib"
SRC_URI="https://github.com/yhirose/cpp-unicodelib/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? ( dev-cpp/catch )
"

PATCHES=( "${FILESDIR}/${P}-system-catch.patch" )

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc README.md
}
