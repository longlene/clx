# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit lua cmake-utils

DESCRIPTION="Integrate the yajl JSON library with Lua"
HOMEPAGE="https://github.com/brimworks/lua-yajl"
SRC_URI="https://github.com/brimworks/lua-yajl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/yajl"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DINSTALL_CMOD=$(lua_get_libdir)
	)
	cmake-utils_src_configure
}
