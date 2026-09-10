# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="ee722b8e9205ee9b1b1c398a4e87e4e393e9be41"

DESCRIPTION="From-scratch C++17 inference port of the OpenMOSS MOSS-TTS family"
HOMEPAGE="https://github.com/mudler/moss-tts.cpp"
SRC_URI="https://github.com/mudler/moss-tts.cpp/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/moss-tts.cpp-${COMMIT}"

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
		-DMOSS_TTS_BUILD_EXAMPLES=ON
		-DMOSS_TTS_SHARED=OFF
		-DMOSS_TTS_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	dobin "${BUILD_DIR}/bin/moss-tts-cli"
}
