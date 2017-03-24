# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="dbf7779d943a4fc9884d8ac7c7c7a7c11abc0604"

DESCRIPTION="Lua bindings for the POCO C++ library"
HOMEPAGE="https://github.com/ma-bo/lua-poco"
SRC_URI="https://github.com/ma-bo/lua-poco/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/poco
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/POCO_DIR/,/include_directories(${POCO_INSTALL_DIR}/d' -i CMakeLists.txt
	sed -e '/add_definitions(-DPOCO_STATIC)/d' \
		-e '/poco_static/d' \
		-i src/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DPOCO_INSTALL_DIR=/usr
	)
	cmake-utils_src_configure
}

src_install() {
	lua_install_cmodule ${BUILD_DIR}/src/poco.so
	dodoc README.md
}

