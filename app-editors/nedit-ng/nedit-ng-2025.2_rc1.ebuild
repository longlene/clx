# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A Qt port of the NEdit text editor"
HOMEPAGE="https://github.com/eteran/nedit-ng"
SRC_URI="https://github.com/eteran/nedit-ng/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-cpp/yaml-cpp
	dev-qt/qtbase
	dev-qt/qttools
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/bison
	dev-qt/qttools
"

# The vendored Microsoft GSL is kept: it is header-only and has no
# Gentoo package; the vendored yaml-cpp is replaced by dev-cpp/yaml-cpp.
PATCHES=( "${FILESDIR}/${P}-system-yaml-cpp.patch" )

src_configure() {
	local mycmakeargs=(
		# Upstream builds static libs by default; the Util<->Regex target
		# cycle is only legal for static libraries.
		-DBUILD_SHARED_LIBS=OFF
		-DNEDIT_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodoc README.md
}
