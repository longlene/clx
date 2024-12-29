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
IUSE="cuda +openvino sdl2"

DEPEND="
	net-misc/curl
	cuda? ( dev-util/nvidia-cuda-toolkit )
	openvino? ( sci-libs/openvino )
	sdl2? ( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWHISPER_BUILD_TESTS=OFF
		-DWHISPER_CURL=ON
		-DWHISPER_SDL2=$(usex sdl2)
		-DWHISPER_OPENVINO=$(usex openvino)
		-DGGML_CUDA=$(usex cuda)
	)
	cmake_src_configure
}
