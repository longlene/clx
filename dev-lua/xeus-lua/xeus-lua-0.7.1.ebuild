# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Jupyter kernel for Lua"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-lua"
SRC_URI="https://github.com/jupyter-xeus/xeus-lua/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="luajit"

DEPEND="
	dev-cpp/xeus
	dev-cpp/xtl
	dev-cpp/xwidgets
	luajit? ( dev-lang/luajit )
	!luajit? ( dev-lang/lua )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DXEUS_LUA_USE_LUAJIT=$(usex luajit)
	)
	cmake_src_configure
}