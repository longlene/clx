# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua cmake-utils

DESCRIPTION="LuaCURL is a module providing Internet browsing capabilities based on the cURL library"
HOMEPAGE="http://luaforge.net/projects/luacurl/"
SRC_URI="https://github.com/LuaDist/luacurl/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_cmodule ${CMAKE_BUILD_DIR}/luacurl.so
}
