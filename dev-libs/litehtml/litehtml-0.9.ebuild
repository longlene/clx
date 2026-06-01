# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast and lightweight HTML/CSS rendering engine"
HOMEPAGE="http://www.litehtml.com/ https://github.com/litehtml/litehtml"
SRC_URI="https://github.com/litehtml/litehtml/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="dev-libs/gumbo:="
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/pkgconf
	test? ( dev-cpp/gtest )
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
	use test && mycmakeargs+=( -DEXTERNAL_GTEST=ON )
	cmake_src_configure
}
