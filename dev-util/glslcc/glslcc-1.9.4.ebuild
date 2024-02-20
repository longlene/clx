# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

GLSLANG_PV="14.0.0"

DESCRIPTION="GLSL cross-compiler tool"
HOMEPAGE="https://github.com/axmolengine/glslcc"
SRC_URI="
	https://github.com/axmolengine/glslcc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/KhronosGroup/glslang/archive/refs/tags/${GLSLANG_PV}.tar.gz -> glslang-${GLSLANG_PV}.tar.gz
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/spirv-tools
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	mv "${WORKDIR}"/glslang-${GLSLANG_PV} "${S}"/3rdparty/glslang
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_OPT=OFF
		-DALLOW_EXTERNAL_SPIRV_TOOLS=ON
	)
	cmake_src_configure
}
