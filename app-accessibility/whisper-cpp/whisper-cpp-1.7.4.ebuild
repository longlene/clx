# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Port of OpenAI's Whisper model in C/C++"
HOMEPAGE="https://github.com/ggerganov/whisper.cpp"
SRC_URI="https://github.com/ggerganov/whisper.cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+models opencl openvino sdl2"

DEPEND="
	sci-libs/ggml[opencl?]
	sci-libs/clblast
	net-misc/curl
	opencl? ( sci-libs/clblast:= )
	openvino? ( sci-libs/openvino )
	sdl2? ( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}
	models? ( app-accessibility/whisper-ggml-models )
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/whisper-cpp-${PV}-default-model-path.patch
	"${FILESDIR}"/system-ggml.patch
)

src_configure() {
	local mycmakeargs=(
		-DWHISPER_BUILD_TESTS=OFF
		-DWHISPER_CLBLAST=$(usex opencl)
		-DWHISPER_CURL=ON
		-DWHISPER_SDL2=$(usex sdl2)
		-DWHISPER_OPENVINO=$(usex openvino)
	)
	cmake_src_configure
}
