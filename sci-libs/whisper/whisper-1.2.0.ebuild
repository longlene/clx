# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="Port of OpenAI's Whisper model in C/C++"
HOMEPAGE="https://github.com/ggerganov/whisper.cpp"
SRC_URI="https://github.com/ggerganov/whisper.cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas sdl2"

DEPEND="
	blas? ( sci-libs/openblas )
	sdl2? ( media-libs/libsdl2 )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "/DESTINATION/{s#DESTINATION lib#DESTINATION $(get_libdir)#}" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWHISPER_BUILD_TESTS=OFF
		-DWHISPER_SUPPORT_SDL2=$(usex sdl2)
		-DWHISPER_SUPPORT_OPENBLAS=$(usex blas)
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins whisper.h
	cmake_src_install
}
