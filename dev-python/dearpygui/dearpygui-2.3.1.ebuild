# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

MY_IMGUI_SHA="3912b3d9a9c1b3f17431aebafd86d2f40ee6e59c"
MY_IMPLOT_SHA="4707b245fbcd69075b1a8a74fa8d2435561b3134"
MY_GLFW_SHA="45ce5ddd197d5c58f50fdd3296a5131c894e5527"

inherit cmake python-single-r1

DESCRIPTION="Fast and powerful Graphical User Interface Toolkit for Python"
HOMEPAGE="https://dearpygui.readthedocs.io/ https://github.com/hoffstadt/DearPyGui"
SRC_URI="
	https://github.com/hoffstadt/DearPyGui/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ocornut/imgui/archive/${MY_IMGUI_SHA}.tar.gz
		-> imgui-${MY_IMGUI_SHA:0:12}.gh.tar.gz
	https://github.com/epezent/implot/archive/${MY_IMPLOT_SHA}.tar.gz
		-> implot-${MY_IMPLOT_SHA:0:12}.gh.tar.gz
	https://github.com/glfw/glfw/archive/${MY_GLFW_SHA}.tar.gz
		-> glfw-${MY_GLFW_SHA:0:12}.gh.tar.gz
"

S="${WORKDIR}/DearPyGui-${PV}"

LICENSE="MIT ZLIB"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	virtual/opengl
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libXxf86vm
"
RDEPEND="${DEPEND}"
BDEPEND="${PYTHON_DEPS}"

RESTRICT="test"

src_unpack() {
	default
	# Replace empty git-submodule placeholders with actual source trees
	rmdir "${S}/thirdparty/imgui" || die
	mv "${WORKDIR}/imgui-${MY_IMGUI_SHA}" "${S}/thirdparty/imgui" || die
	rmdir "${S}/thirdparty/implot" || die
	mv "${WORKDIR}/implot-${MY_IMPLOT_SHA}" "${S}/thirdparty/implot" || die
	rmdir "${S}/thirdparty/glfw" || die
	mv "${WORKDIR}/glfw-${MY_GLFW_SHA}" "${S}/thirdparty/glfw" || die
}

src_configure() {
	local mv_py_ver="${EPYTHON##python}"
	local mycmakeargs=(
		-DMVDIST_ONLY=True
		-DMVDPG_VERSION="${PV}"
		-DMV_PY_VERSION="${mv_py_ver}"
		# Build bundled glfw as static lib to avoid RPATH issues
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

src_install() {
	local sitedir
	sitedir="$(python_get_sitedir)"

	insinto "${sitedir#${EPREFIX}}/dearpygui"
	doins "${S}/cmake-build-local/DearPyGui/_dearpygui.so"
	doins "${S}/dearpygui/dearpygui.py"
	doins "${S}/dearpygui/demo.py"
	doins "${S}/dearpygui/experimental.py"
	doins "${S}/dearpygui/type_info.py"
	doins "${S}/dearpygui/_dearpygui.pyi"
	doins "${S}/dearpygui/_deprecated.py"
	doins "${S}/dearpygui/_header.py"
	doins "${S}/dearpygui/__init__.py"

	python_optimize "${ED}${sitedir}/dearpygui"
}
