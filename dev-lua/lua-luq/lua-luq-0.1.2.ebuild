# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake-utils lua

DESCRIPTION="Light userdata queue"
HOMEPAGE="https://github.com/moteus/lua-luq"
SRC_URI="https://github.com/moteus/lua-luq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DINSTALL_LMOD=$(lua_get_sharedir)
	-DINSTALL_CMOD=$(lua_get_libdir)
	)
	cmake-utils_src_configure
}

