# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="On-device VAD, streaming STT, TTS and diarization in C++17"
HOMEPAGE="https://github.com/soniqo/speech-core"
SRC_URI="https://github.com/soniqo/speech-core/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

PATCHES=(
	"${FILESDIR}"/${P}-gnuinstalldirs.patch
)

src_configure() {
	local mycmakeargs=(
		-DSPEECH_CORE_BUILD_TESTS=$(usex test)
		-DSPEECH_CORE_WITH_ONNX=OFF
		-DSPEECH_CORE_WITH_LITERT=OFF
		-DSPEECH_CORE_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
