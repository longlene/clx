# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="LuaJIT FFI binding to the nanomsg library"
HOMEPAGE="https://github.com/nanomsg/luajit-nanomsg"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nanomsg/luajit-nanomsg.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	lua_install_module nanomsg-ffi.lua
}
