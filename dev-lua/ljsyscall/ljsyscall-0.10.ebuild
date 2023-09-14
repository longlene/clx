# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit lua

DESCRIPTION="LuaJIT Unix syscall FFI"
HOMEPAGE="http://www.myriabit.com/ljsyscall"
SRC_URI="https://github.com/justincormack/ljsyscall/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module -r syscall syscall.lua
	dodoc README.md
}
