# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Embedded graphics library to create beautiful UIs"
HOMEPAGE="https://lvgl.io"
SRC_URI="https://github.com/lvgl/lvgl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR=$(get_libdir)
		-DLV_CONF_BUILD_DISABLE_THORVG_INTERNAL=ON
		-DLV_CONF_BUILD_DISABLE_DEMOS=ON
	)
	cmake_src_configure
}
