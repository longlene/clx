# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_TAG="ee825ac"

inherit cmake

DESCRIPTION="CosyVoice TTS inference in C/C++"
HOMEPAGE="https://github.com/Lourdle/cosyvoice.cpp"
SRC_URI="https://github.com/Lourdle/cosyvoice.cpp/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/cosyvoice.cpp-${MY_TAG}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ffmpeg frontend icu"

DEPEND="
	sci-ml/ggml
	dev-libs/libpcre2
	icu? ( dev-libs/icu:= )
	frontend? ( sci-libs/onnxruntime )
	ffmpeg? ( media-video/ffmpeg:= )
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}/cosyvoice-cpp-0_p20260622-system-deps.patch"
)

src_configure() {
	local mycmakeargs=(
		-DCOSYVOICE_NO_ICU=$(usex icu no yes)
		-DCOSYVOICE_NO_FRONTEND=$(usex frontend no yes)
		-DCOSYVOICE_NO_AUDIO=no
		-DCOSYVOICE_AUDIO_BACKEND=$(usex ffmpeg FFMPEG MINIAUDIO)
	)
	cmake_src_configure
}
