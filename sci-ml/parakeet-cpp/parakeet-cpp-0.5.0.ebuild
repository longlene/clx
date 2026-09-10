# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Parakeet ASR model implementation in C++ with ggml"
HOMEPAGE="https://github.com/mudler/parakeet.cpp"
SRC_URI="https://github.com/mudler/parakeet.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/parakeet.cpp-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda test"
RESTRICT="!test? ( test )"

DEPEND="sci-ml/ggml:=[cuda?]"
RDEPEND="
	${DEPEND}
	|| ( net-misc/curl net-misc/wget )
"
BDEPEND="test? ( dev-cpp/gtest )"

PATCHES=( "${FILESDIR}/${P}-system-ggml.patch" )

src_configure() {
	local mycmakeargs=(
		-DPARAKEET_BUILD_CLI=ON
		-DPARAKEET_BUILD_SERVER=ON
		-DPARAKEET_SHARED=OFF
		-DPARAKEET_BUILD_TESTS=$(usex test)
	)
	use test && mycmakeargs+=( -DPARAKEET_EXTERNAL_GTEST=ON )
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/examples/cli/parakeet-cli"
	dobin "${BUILD_DIR}/examples/server/parakeet-server"
	dolib.a "${BUILD_DIR}/libparakeet.a"
	insinto /usr/include/parakeet
	doins include/*.h
	dodoc README.md
}
