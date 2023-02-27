# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Immediate Mode Text-based User Interface C++ Library"
HOMEPAGE="https://imtui.ggerganov.com/"
SRC_URI="
	https://github.com/ggerganov/imtui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ggerganov/imgui/archive/738606a2943a8a11316fa15b319193a2baa84bc0.tar.gz -> imgui-738606a2943a8a11316fa15b319193a2baa84bc0.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="!media-libs/imgui"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third-party/imgui/imgui && ln -sv "${WORKDIR}"/imgui-738606a2943a8a11316fa15b319193a2baa84bc0 third-party/imgui/imgui
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DIMTUI_BUILD_EXAMPLES=OFF
	)
	cmake_src_configure
}
