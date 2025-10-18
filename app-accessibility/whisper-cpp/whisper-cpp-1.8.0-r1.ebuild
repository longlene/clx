# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Port of OpenAI's Whisper model in C/C++"
HOMEPAGE="https://github.com/ggml-org/whisper.cpp"
SRC_URI="https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+models ffmpeg -opencl openvino sdl2 vulkan"

DEPEND="
	sci-ml/ggml[opencl?,vulkan?]
	net-misc/curl
	openvino? ( sci-libs/openvino )
	sdl2? ( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}
	models? ( app-accessibility/whisper-ggml-models )
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/whisper-cpp-1.7.5-default-model-path.patch
)

src_configure() {
	local mycmakeargs=(
		-DWHISPER_USE_SYSTEM_GGML=ON
		-DWHISPER_BUILD_TESTS=OFF
		-DWHISPER_CURL=ON
		-DWHISPER_FFMPEG=$(usex ffmpeg)
		-DWHISPER_SDL2=$(usex sdl2)
		-DWHISPER_OPENVINO=$(usex openvino)
	)
	cmake_src_configure
}
