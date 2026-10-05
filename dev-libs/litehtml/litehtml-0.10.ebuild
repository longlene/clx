# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast and lightweight HTML/CSS rendering engine"
HOMEPAGE="http://www.litehtml.com/ https://github.com/litehtml/litehtml"
# Pinned by upstream CMakeLists' ExternalProject for the tests repo.
TESTS_COMMIT="2bb4d22d7d2a0916e4ec69e30d71b39bfe3b7b8a"

SRC_URI="https://github.com/litehtml/litehtml/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/litehtml/litehtml-tests/archive/${TESTS_COMMIT}.tar.gz -> litehtml-tests-${TESTS_COMMIT}.tar.gz
"

LICENSE="BSD Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="dev-libs/gumbo:="
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/pkgconf
	test? (
		dev-cpp/gtest
		media-libs/fontconfig
		x11-libs/cairo
		x11-libs/gtk+3
		x11-libs/pango
	)
"

src_prepare() {
	eapply "${FILESDIR}/${P}-external-gumbo.patch"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLITEHTML_BUILD_TESTING=$(usex test)
		-DEXTERNAL_GUMBO=ON
	)
	use test && mycmakeargs+=( -Dlitehtml_tests_URL="${WORKDIR}/litehtml-tests-${TESTS_COMMIT}.tar.gz" )
	cmake_src_configure
}
