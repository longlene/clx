# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="ggml/C++ port of Nvidia's Magpie TTS"
HOMEPAGE="https://github.com/mudler/magpie-tts.cpp"
SRC_URI="https://github.com/mudler/magpie-tts.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/magpie-tts.cpp-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda test"
RESTRICT="!test? ( test )"

DEPEND="sci-ml/ggml:=[cuda?]"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-system-ggml.patch" )

src_configure() {
	local mycmakeargs=(
		-DMAGPIE_BUILD_CLI=ON
		-DMAGPIE_SHARED=OFF
		-DMAGPIE_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/examples/cli/magpie-cli"
	dolib.a "${BUILD_DIR}/libmagpie-tts.a"
	insinto /usr/include/magpie-tts
	doins include/*.h
	dodoc README.md
}
