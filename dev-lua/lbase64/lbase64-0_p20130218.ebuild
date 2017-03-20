# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="23143f34b0dd293cd815dce2f616de2545c33d58"

DESCRIPTION="A Base64 library for Lua"
HOMEPAGE="https://github.com/LuaDist/lbase64"
SRC_URI="https://github.com/LuaDist/lbase64/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/install_data/d' \
		-e '/install_test/d' \
		-e '/add_lua_test/d' \
		-i CMakeLists.txt
	lua_version
	sed -e "/set\ ( INSTALL_/s#/lua#/lua/${LUAVER}#" \
		-i cmake/lua.cmake
}
